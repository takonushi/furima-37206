FactoryBot.define do
  factory :order_sending do
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 1, to: 47) }
    city              { '東京都' }
    house_number      { '1-1' }
    building_name     { '東京ハイツ' }
    telephone_number  { '09011112222' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
