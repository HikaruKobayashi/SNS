class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :uid
  has_many :tweets
end
