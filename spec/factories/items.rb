FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    explanation       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 1, to: 10) }
    condition_id      { Faker::Number.between(from: 1, to: 6) }
    charge_id         { Faker::Number.between(from: 1, to: 2) }
    prefecture_id     { Faker::Number.between(from: 1, to: 47) }
    number_of_days_id { Faker::Number.between(from: 1, to: 3) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
