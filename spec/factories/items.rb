FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    content { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 1, to: 100) }
    status_id { Faker::Number.between(from: 1, to: Status.count) }
    shipping_status_id { Faker::Number.between(from: 1, to: ShippingStatus.count) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { FactoryBot.create(:scheduled_delivery).id }
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
