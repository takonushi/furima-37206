class Order < ApplicationRecord
  attr_accessor :token, :price
  validates :token, presence: true
end
