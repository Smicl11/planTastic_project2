class EventsController < ApplicationController
  def index
    @event = Event.all
    @user = User.find_by_id(params[:id])
    render :index
  end

  def show
    @event = Event.find_by_slug(params[:id])
    @comments = @event.comments
    render :show
  end

  def new
    @event = Event.new
    @user = User.find_by_id(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @user = User.find_by_id(params[:id])
    if @event.photo == ""
      @event.photo = "/placeholder.jpg"
    end
    if @event.save
      flash[:notice] = "Let's party! Your event has been successfully created!"
      redirect_to event_path(@event)
    else
      flash[:error] = "Insufficient information. Please Try again"
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find_by_slug(params[:id])
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def update
    @event = Event.find_by_slug(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash[:error] = "There was a problem saving your changes"
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find_by_slug(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :event_date, :event_time, :description, :photo, :slug)
  end
end
