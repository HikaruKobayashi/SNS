class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :image
  belongs_to :user
  has_many :blog_likes

  def username
    object.user.name
  end
end