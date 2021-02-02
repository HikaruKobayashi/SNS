class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :uid, :profile, :avatar_url
  has_many :tweets
  has_many :blogs
end
