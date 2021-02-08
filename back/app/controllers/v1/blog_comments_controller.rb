class V1::BlogCommentsController < ApplicationController
  def index
    @blog_comment = BlogComment.where(blog_id: params[:blog_id]).order(created_at: :asc)

    render json: @blog_comment
  end

  def show
    @blog_comment = User.find(params[:id])
    if @blog_comment
      render json: @blog_comment
    end
  end

  def create
    current_user = User.find(params[:current_user_id])
    @blog_comment = current_user.blog_comments.build(blog_comment_params)

    if @blog_comment.save
      render json: @blog_comment
    end
  end

  private

  def blog_comment_params
    params.permit(:text, :user_id, :blog_id)
  end
end