class AttendancesController < ApplicationController

  def new
    @event = Event.find_by(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    if current_user
      @attendance = Attendance.new(attendance_params)
      @event = Event.find(params[:id])
      if @attendance.save
        @event.attendances << @attendance
        @event.save
        flash[:notice] = "Thank you for joining" + @event.title
        redirect_to @event
      else
        @attendance.destroy
        flash[:error] = "Something went wrong, please try again."
        redirect_to new_attendance_path(@attendance)
      end
    else
      flash[:error] = "You must be logged in to join events"
      redirect_to new_attendance_path
    end
  end

  def edit
    attendance_id = params[:id]
    @attendance = Attendance.find_by_id(attendance_id)
    render :edit
  end

  def update
    get_id.update_attributes(attendance_params)
    redirect_to user_path(user)
  end

  def destroy
    get_id.destroy
    redirect_to user_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:contribution)
  end
end
