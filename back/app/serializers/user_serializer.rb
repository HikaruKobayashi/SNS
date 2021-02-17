class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :uid, :profile, :avatar_url
  has_many :tweets
  has_many :comments
  has_many :tweet_likes
  has_many :blogs
  has_many :blog_likes
end
