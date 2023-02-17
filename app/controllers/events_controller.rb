class EventsController < ApplicationController
  def index
    @categories = Category.all
    if (params[:category_id])
      @events = Event.all.where(category_id: params[:category_id]).order(:event_date).reverse_order
    else
      @events = Event.all.order(:event_date).reverse_order
    end
  end

  def new
    @categories = Category.all
    @event = Event.new
  end

  def create
    @event = Event.new(form_params)
    @event.organisor_id = current_user.id
    @categories = Category.all

    # debugger
    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def enroll
    @registration = Registration.new
    @registration.user_id = current_user.id
    @registration.event_id = params[:id]
    # debugger
    if @registration.save
      redirect_to :action => "show"
    else
      redirect_to :action => "index"
    end
  end

  def show
    @events = current_user.events
  end

  def edit
    @event = Event.find(params[:id])
    @categories = Category.all
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(form_params)
      redirect_to events_organised_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def organised
    if @address = current_user.address
      @address
    end
    @organised_events = current_user.gathering
  end

  private

  def form_params
    params.require(:event).permit(:name, :event_date, :description, :category_id)
  end
end
