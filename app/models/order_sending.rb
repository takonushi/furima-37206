class OrderSending
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_id, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :telephone_number
    #validates :order_id - order_idは下記のsave時に初めてID登録されるからこの時点でvalidationをかけるべきではない？)
    validates :user_id
    validates :item_id
    validates :price
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Sending.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end



end