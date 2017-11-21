class Movie < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  has_many :reviews
end
