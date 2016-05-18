class AttendancesController < ApplicationController

  def new
    @event = Event.find_by_slug(params[:id])
    @user = User.find_by(params[:user_id])
    @attendance = Attendance.new
  end

  def create
    if current_user
      @attendance = Attendance.new(attendance_params)
      @user = User.find_by(params[:user_id])
      @event = Event.find_by_slug(params[:id])
      if @attendance.save
        @event.attendances << @attendance
        @current_user.attendances << @attendance
        @event.save
        @current_user.save
        flash[:notice] = "Thank you for joining " + @event.title
        redirect_to @event

      elsif @attendance.destroy
        flash[:error] = "There was a problem, try again"
        redirect_to @event
      else
        flash[:error] = "You must be logged in to join events"
        redirect_to new_attendance_path
      end
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
    params.require(:attendance).permit(:user_id, :event_id, :contribution)
  end

  def set_user
  @user = @attendance.user_id
  end

end
