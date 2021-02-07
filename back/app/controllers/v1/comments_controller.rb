class V1::CommentsController < ApplicationController
  def index
    @comment = Comment.all
    render json: @comment
  end

  def show
    @comment = User.find(params[:id])
    if @comment
      render json: @comment
    end
  end

  def create
    current_user = User.find(params[:current_user_id])
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      render json: @comment
    end
  end

  private

  def comment_params
    params.permit(:text, :user_id, :tweet_id)
  end
end
