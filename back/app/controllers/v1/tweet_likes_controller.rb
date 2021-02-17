class V1::TweetLikesController < ApplicationController
  def index
    @tweet_like = TweetLike.where(tweet_id: params[:tweet_id]).order(created_at: :asc)

    render json: @tweet_like
  end

  def show
    @tweet_like = TweetLike.find(params[:id])
    if @tweet_like
      render json: @tweet_like
    end
  end

  def create
    current_user = User.find(params[:current_user_id])

    @tweet_like = current_user.tweet_likes.build(tweet_likes_params)

    if @tweet_like.save
      render json: @tweet_like
    end
  end

  def destroy
    @tweet_like = TweetLike.find(params[:id]).destroy

    render json: @tweet_like
  end

  private

  def tweet_likes_params
    params.permit(:user_id, :tweet_id)
  end
end