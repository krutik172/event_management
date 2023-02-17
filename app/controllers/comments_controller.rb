class CommentsController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @comments = @event.comments
    @liked_comments = current_user.likes.pluck(:comment_id)
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    redirect_to "/events/details/" + comment_params[:event_id].to_s
  end

  def like
    Like.create(user_id: current_user.id, comment_id: params[:comment_id])
    redirect_to "/events/details/" + params[:event_id].to_s
  end

  def unlike
    like = Like.where(user_id: current_user.id, comment_id: params[:comment_id])
    like.destroy_all
    redirect_to "/events/details/" + params[:event_id].to_s
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :event_id)
  end
end
