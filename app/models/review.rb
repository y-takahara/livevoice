class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy

  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  
end
