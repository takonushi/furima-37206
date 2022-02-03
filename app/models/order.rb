class Order < ApplicationRecord
  attr_accessor :token, :price

  belongs_to :user
  belongs_to :item
  has_one :sending
end
