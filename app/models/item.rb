class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :discription
    validates :category_id
    validates :condition_id
    validates :price
    validates :shipping_fee_id
    validates :prefecture_id
    validates :ship_day_id
  end

  belongs_to :user
  has_one_attached :image

end


