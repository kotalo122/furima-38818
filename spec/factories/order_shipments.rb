FactoryBot.define do
  factory :order_shipment do
        post_code       { '123-4567' }
        prefecture_id   { 5 }
        city            { '港区' }
        block           { '1-1' }
        building_name   { 'サンハイツわたなべ' }
        phone           { '0339020022' }
        token {"tok_abcdefghijk00000000000000000"}
      end

end
