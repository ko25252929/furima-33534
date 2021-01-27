FactoryBot.define do
  factory :item do
    name { 'test' }
    price              { 400 }
    text               { 'aaaa' }
    category_id        { 2 }
    condition_id       { 2 }
    cost_id            { 2 }
    prefectures_id     { 2 }
    shipping_days_id   { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
