class Offer < ApplicationRecord
  validates :offer_content, presence: true, length: {maximum: 255}
  
  belongs_to :user
  # has_many :comments, dependent: :destroy
end
