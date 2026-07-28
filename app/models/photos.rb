class Photo < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
end
