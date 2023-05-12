FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    area_id { 1 }
    city { '東京都' }
    address_line { '1-1' }
    building { '東京ハイツ' }
    phone_number { 9120111222 }
  end
end
