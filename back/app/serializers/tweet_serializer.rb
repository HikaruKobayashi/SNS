class TweetSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :username
  belongs_to :user
  belongs_to :comments

  def username
    object.user.name
  end
end
