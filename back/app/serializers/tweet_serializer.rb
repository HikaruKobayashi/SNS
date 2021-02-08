class TweetSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :username
  belongs_to :user
  has_many :comments

  def username
    object.user.name
  end
end
