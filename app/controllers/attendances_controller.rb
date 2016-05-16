class AttendancesController < ApplicationController

  def new
    @event = Event.find_by(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    @event = Event.find_by(params[:event_id])
    @attendance = Attendance.create(attendance_params)
  end

  def edit
    attendance_id = params[:id]
    @attendance = Attendance.find_by_id(attendance_id)
    render :edit
  end

  def update
    get_id.update_attributes(comment_params)
    redirect_to user_path(user)
  end

  def destroy
    get_id.destroy
    redirect_to user_path
  end

end
