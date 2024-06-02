FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    content { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    genre_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { FactoryBot.create(:scheduled_delivery).id }
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
