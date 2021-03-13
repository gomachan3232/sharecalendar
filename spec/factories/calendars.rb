FactoryBot.define do
  factory :calendar do
    name { Faker::Name.initials(number: 15) }
  end
end
