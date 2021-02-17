class TweetLikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tweet_id
  belongs_to :user
  belongs_to :tweet
end