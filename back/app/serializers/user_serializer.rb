class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :uid, :profile, :image
  has_many :tweets
end
