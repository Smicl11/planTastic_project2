class CommentsController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :comment_params, only: [:update, :create]

  def new
    @comment = Comment.new
    render :new
  end

  def create
    
    @event = Event.find_by_id(params[:id])
    @comment = Comment.create(comment_params)
    @event.comments << @comment

    redirect_to event_path
  end

  def edit
    comment_id = params[:id]
    @comment = Comment.find_by_id(comment_id)
    render :edit
  end

  def update
    get_id.update_attributes(comment_params)
    redirect_to event_path

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
