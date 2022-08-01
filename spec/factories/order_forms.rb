FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    area_id { Faker::Number.between(from: 1, to: 47) }
    city { '福山市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
