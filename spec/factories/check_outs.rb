FactoryBot.define do
  factory :check_out do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    addresses { Faker::Address.street_address }
    city { Faker::Address.city }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token {'************************'}
    building { Faker::Address.secondary_address }
  end
end
