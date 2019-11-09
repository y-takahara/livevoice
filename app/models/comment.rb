class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :text,presence: true,length: { maximum: 30 }
end
