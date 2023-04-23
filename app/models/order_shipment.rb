class OrderShipment

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building_name, :phone, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,   numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :city
    validates :block
    validates :phone, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    order = Order.create( user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name ,phone: phone, order_id: order.id)
  end


end
