class Photo < ApplicationRecord
  belongs_to :album
  
  validates_presence_of :title

  mount_uploader :image, ImageUploader

end
