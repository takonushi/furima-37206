class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :number_of_days

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :number_of_days_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: {only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}


end
