FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    confirmed_at { Time.zone.today }
    name { Faker::Name.name }
    admin { false }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
