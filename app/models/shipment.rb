class Shipment < ApplicationRecord
  
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id,   numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :city
    validates :block
    validates :phone
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  belongs_to :order
end
