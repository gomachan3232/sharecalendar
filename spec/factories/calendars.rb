FactoryBot.define do
  factory :calendar do
    calendar_name { Faker::Name.initials(number: 15) }
  end
end
