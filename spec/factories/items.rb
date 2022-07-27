FactoryBot.define do
  factory :item do
    association :user

    name {Faker::Name.name}
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    cost_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 1, to: 47) }
    days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
