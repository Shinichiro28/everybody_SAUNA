FactoryBot.define do
  factory :post do
    visit_date { Faker::Lorem.characters(number: 10) }
    sauna_minutes { Faker::Lorem.characters(number: 1) }
    mizu_minutes { Faker::Lorem.characters(number: 1) }
    totonoi_minutes { Faker::Lorem.characters(number: 3) }
    sauna_times { Faker::Lorem.characters(number: 3) }
    sauna_temperature { Faker::Lorem.characters(number: 3) }
    mizu_temperature { Faker::Lorem.characters(number: 3) }
    sauna_post { Faker::Lorem.characters(number: 30) }
    food_name { Faker::Lorem.characters(number: 5) }
    food_post { Faker::Lorem.characters(number: 30) }
  end
end