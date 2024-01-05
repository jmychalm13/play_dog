class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render :index
  end

  def create
    @comment = Comment.create(
      content: params[:content],
      user_id: params[:user_id],
      playdate_id: params[:playdate_id],
    )
    if @comment.valid?
      render :show
    else
      render json: { message: "There was an error." }
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(
      content: params[:content] || comment.content
    )
    if @comment.valid?
      render :show
    else
      render json: { message: "There was an error updating" }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { message: "Comment successfully deleted." }
  end
end
