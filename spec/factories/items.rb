FactoryBot.define do
  factory :item do
    item_name          { Faker::Name.name[0..40] }
    discription        { Faker::Lorem.sentence(word_count: 1000) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    price              { Faker::Number.between(from: 300, to: 9999999) }
    shipping_fee_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    ship_day_id        { Faker::Number.between(from: 2, to: 4) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
