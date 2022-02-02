class Order < ApplicationRecord
  attr_accessor :token, :price
  validates :token, presence: true

  belongs_to :user
  belongs_to :item
  has_one :sending
end
