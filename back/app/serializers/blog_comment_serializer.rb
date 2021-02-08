class BlogCommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :blog_id
  belongs_to :user
  belongs_to :blog
end