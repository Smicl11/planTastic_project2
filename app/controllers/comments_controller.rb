class CommentsController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :comment_params, only: [:update, :create]
  def index
    @comments = Comment.all
    render :index
  end

  def new
    @comment = Comment.new
    render :new
  end

  def create
  end

  def edit
    comment_id = params[:id]
    @comment = Comment.find_by_id(comment_id)
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

  private

  def get_id
    comment_id = params[:id]
    Comment.find_by_id(comment_id)
  end

  def comment_params
    params.require(:comment).permit(:description, :contribution)
  end

end
