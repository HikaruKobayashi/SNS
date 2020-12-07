class V1::TweetsController < ApplicationController
  def index
    tweet = Tweet.all.order(created_at: :desc)
    render json: tweet
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: tweet, status: :created
    else
      render json: tweet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
        render json: tweet
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :user_id)
  end
end
