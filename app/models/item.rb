class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :discription
    validates :category_id,     numericality: { other_than: 1 , message: "Category can't be blank"}
    validates :condition_id,    numericality: { other_than: 1 , message: "Condition can't be blank"}
    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999,
      message: 'must be between ¥300 and ¥9,999,999'
    }
    validates :shipping_fee_id, numericality: { other_than: 1 , message: "Shipping fee can't be blank"}
    validates :prefecture_id,   numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :ship_day_id,     numericality: { other_than: 1 , message: "Ship_day can't be blank"}
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :ship_day
  
  belongs_to :user
  has_one_attached :image

end


