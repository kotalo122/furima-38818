class OrderShipment

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :phone, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,   numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :city
    validates :block
    validates :phone
    validates :user_id
    validates :item_id
  end


  def save
    order = Order.create( user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, phone: phone, order_id: order.id)
  end


end
