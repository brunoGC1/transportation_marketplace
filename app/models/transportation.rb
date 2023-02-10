class Transportation < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many_attached :photos # Cloudinary
  validates :brand, :brand_model, :price, presence: true
end
