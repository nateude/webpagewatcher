FactoryBot.define do
  factory :website do
    url { Faker::Internet.email }
    name { Faker::Name.name }
    user { create(:user) }
  end
end
