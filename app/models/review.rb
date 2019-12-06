class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy

  validates :artist,presence: true
  validates :text, presence: true

end
