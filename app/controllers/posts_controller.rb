class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy show_comments add_comment like unlike ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @liked_posts = current_user.post_likes.pluck(:post_id)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @liked_posts = current_user.post_likes.pluck(:post_id)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.turbo_stream
    end
  end

  def show_comments
    @comments = @post.post_comments
    @comment = PostComment.new
  end

  def add_comment
    @comment = PostComment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path }
      else
        format.html { render :new_comment, status: :unprocessable_entity }
      end
    end
  end

  def like
    @pl = PostLike.new()
    @pl.post_id = @post.id
    @pl.user_id = current_user.id
    @pl.save
    redirect_to posts_path
  end

  def unlike
    @pl = PostLike.where("post_id = ? AND user_id = ?", @post.id, current_user.id)

    @pl.delete_all
    redirect_to posts_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description)
  end

  def comment_params
    params.require(:post_comment).permit(:comment)
  end
end
