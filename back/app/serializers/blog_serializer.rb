class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :image
  belongs_to :user

  def username
    object.user.name
  end
end