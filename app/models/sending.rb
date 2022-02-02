class Sending < ApplicationRecord
  belongs_to :order




  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
end
