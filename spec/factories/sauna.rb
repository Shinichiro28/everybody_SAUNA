FactoryBot.define do
  factory :sauna do
    name { Faker::Lorem.characters(number: 10) }
    postcode { Faker::Lorem.characters(number: 7) }
    address { Faker::Lorem.characters(number: 20) }
    tel { Faker::Lorem.characters(number: 10) }
    hp { Faker::Lorem.characters(number: 20) }
    access { Faker::Lorem.characters(number: 20) }
    holiday { Faker::Lorem.characters(number: 10) }
    open { Faker::Lorem.characters(number: 10) }
    fee { Faker::Lorem.characters(number: 10) }
    sauna_temperature { Faker::Lorem.characters(number: 3) }
    sauna_capacity { Faker::Lorem.characters(number: 2) }
    mizu_temperature { Faker::Lorem.characters(number: 2) }
    mizu_capacity { Faker::Lorem.characters(number: 3) }
    depth { Faker::Lorem.characters(number: 3) }
  end
end