class Shipment < ApplicationRecord
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,   numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :city
    validates :block
    validates :phone
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  belongs_to :order
end
