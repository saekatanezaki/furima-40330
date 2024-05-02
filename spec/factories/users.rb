FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
    last_name { '山田' } # 任意の姓をセット
    first_name { '太郎' } # 任意の名をセット
    last_name_kana { 'ヤマダ' }  # 任意の姓（カナ）をセット
    first_name_kana { 'タロウ' } # 任意の名（カナ）をセット
  end
end
