class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render :index
  end

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @event = Event.find_by(params[:id])
    @comment = Comment.create(comment_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
