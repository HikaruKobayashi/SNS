class Commentserializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :tweet_id
  belongs_to :user
  belongs_to :tweet
end
