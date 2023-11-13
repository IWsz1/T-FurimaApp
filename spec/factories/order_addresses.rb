FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    postalcode { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Company.name }
    # 11文字の数字
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    # 30文字の英数字
    token { Faker::Alphanumeric.alphanumeric(number: 30) }
  end
end
