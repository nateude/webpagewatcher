FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    website { create(:website) }
    url { Faker::Internet.url }
  end
end
