class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.profile_image == ""
      @user.profile_image = "http://www.oldpotterybarn.co.uk/wp-content/uploads/2015/06/default-medium.png"
    end
    @user.save
    login(@user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to users_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "Successfully Edited!"
        redirect_to @user
      else
        flash[:error] = "Invalid information. Please Try again."
        redirect_to @user
      end
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:error] = "Your profile has been deleted"
    redirect_to root_path
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :profile_image, :password)
  end

end
