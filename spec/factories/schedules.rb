FactoryBot.define do
  factory :schedule do
    date          { '2021-01-01' }
    schedule_name { Faker::Name.initials }
    genre_id      { 2 }
    start_time    { '00:00:00' }
    end_time      { '00:00:00' }
    comment       { Faker::Name.initials }
  end
end
