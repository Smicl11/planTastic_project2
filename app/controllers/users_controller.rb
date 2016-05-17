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
    login(@user)
    redirect_to root_path
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
    if current_user==@user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user==@user
      @user.update(user_params)
      flash[:notice] = "Successfully Edited!"
      redirect_to @user
    else
      redirect_to users_path
    end
  end

  #doesn't delete the DB record of this user.
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :profile_image, :password)
  end

end
