FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.initials(number: 10) }
    email                 { Faker::Internet.unique.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6, max_length: 8) }
    password_confirmation { password }
    birthday              { '2000-01-01' }
  end
end
