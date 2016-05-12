class EventsController < ApplicationController
  def index
    @event = Event.all
    render :index
  end

  def show
    @event = Event.find_by_id(params[:id])
    @comments = @event.comments
    render :show
  end

  def new
    redirect_to edit_path(current_user)
    end
    @event = Event.new
  end
  end

end
