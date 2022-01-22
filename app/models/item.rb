class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :number_of_days_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true

end
