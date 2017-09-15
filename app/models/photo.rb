class Photo < ApplicationRecord
  belongs_to :album
  has_many :comments
  
  validates_presence_of :title

  mount_uploader :image, ImageUploader

end
