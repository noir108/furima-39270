FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    content {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {1}
    status_id {1}
    shipping_fee_id {1}
    area_id {1}
    lead_time_id {1}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
