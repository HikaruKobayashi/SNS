class User < ApplicationRecord
  with_options dependent: :destroy do |assoc|
    assoc.has_many :active_relationships, class_name: 'Relationship',
      foreign_key: 'follower_id'
    assoc.has_many :passive_relationships, class_name: 'Relationship',
      foreign_key: 'followed_id'
    assoc.has_many :user_tag_relationships
  end

  has_many :tweets
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    self.following << other_user
  end

  def unfollow(other_user)
    self.following.delete(other_user)
  end

  def following?(other_user)
    self.following.include?(other_user)
  end

  def following_count
    self.active_relationships.length
  end

  def follower_count
    self.passive_relationships.length
  end
end
