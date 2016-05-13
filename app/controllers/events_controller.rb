class EventsController < ApplicationController
  def index
    @event = Event.all
    render :index
  end

  def show
    @event = Event.find_by_id(params[:id])
    # @comments = @event.comments
    render :show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.photo == ""
      @event.photo = "http://indianasenatedemocrats.org/wp-content/plugins/ajax-search-pro/img/default.jpg"
    end
    @event.save
    redirect_to @user
  end

  def edit
    event_id = params[:id]
    @event = Event.find_by(id: event_id)
    render :edit
  end

  def update
    event_id = params[:id]
    @event = Event.find_by(id: event_id)
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash[:error] = "There was a problem saving your changes"
      redirect_to edit_event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :event_date, :event_time, :description, :photo)
  end
end
