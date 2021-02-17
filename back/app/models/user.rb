class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :tweets, dependent: :destroy
  has_many :tweet_likes, dependent: :destroy
  has_many :tweet_liked, through: :tweet_likes, source: :tweet
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :blog_likes, dependent: :destroy
  has_many :blog_liked, through: :blog_likes, source: :blog
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_one_attached :avatar
  attr_accessor :image

  validates :profile, length: { maximum: 250 }

  def follow(other_user)
    following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def following_count
    self.following_relationships.length
  end

  def follower_count
    self.follower_relationships.length
  end

  def already_blog_liked?(blog)
    self.blog_likes.exists?(blog_id: blog.id)
  end

  def already_tweet_liked?(tweet)
    self.tweet_likes.exists?(tweet_id: tweet.id)
  end

  def avatar=(image)
    if image.present?
      prefix = image[/(image|application)(\/.*)(?=\;)/]
      type = prefix.sub(/(image|application)(\/)/, '')
      data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      avatar.detach if avatar.attached?
      avatar.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end

  def avatar_url
    avatar.attached? ? url_for(avatar) : nil
  end
end
