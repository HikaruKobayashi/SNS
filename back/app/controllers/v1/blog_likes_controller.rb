class V1::BlogLikesController < ApplicationController
  def index
    @blog_like = BlogLike.where(blog_id: params[:blog_id]).order(created_at: :asc)

    render json: @blog_like
  end

  def show
    @blog_like = BlogLike.find(params[:id])
    if @blog_like
      render json: @blog_like
    end
  end

  def create
    current_user = User.find(params[:current_user_id])

    @blog_like = current_user.blog_likes.build(blog_likes_params)

    if @blog_like.save
      render json: @blog_like
    end
  end

  def destroy
    @blog_like = BlogLike.find(params[:id]).destroy

    render json: @blog_like
  end

  private

  def blog_likes_params
    params.permit(:user_id, :blog_id)
  end
end