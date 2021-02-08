class Blog < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :blog_comments, dependent: :destroy

  has_one_attached :eyecatch
  attr_accessor :image

  def eyecatch=(image)
    if image.present?
      prefix = image[/(image|application)(\/.*)(?=\;)/]
      type = prefix.sub(/(image|application)(\/)/, '')
      data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "blog#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      eyecatch.detach if eyecatch.attached?
      eyecatch.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end

  def image
    eyecatch.attached? ? url_for(eyecatch) : nil
  end
end
