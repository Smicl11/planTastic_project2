class CommentsController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :comment_params, only: [:update, :create]

  def new
    @comment = Comment.new
    @event = Event.find_by_slug(params[:id])
    render :new
  end

  def edit
    comment_id = params[:id]
    @comment = Comment.find_by_id(comment_id)
    render :edit
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find_by(params[:user_id])
    @event = Event.find_by_slug(params[:id])
    @event.comments << @comment
    @user.comments << @comment
    @event.save
    @user.save
    @comment.save

      redirect_to event_path(@event)

  end


  def update
    get_id.update_attributes(comment_params)
    redirect_to user_path(user)
  end

  def destroy

    @event = Event.find_by_slug(params[:event_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy

    redirect_to event_path(@event)

  end

  private

  def get_id
    comment_id = params[:id]
    Comment.find_by_id(comment_id)
    event_id = params[:id]
    Event.find_by_slug(event_id)
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

end
