FactoryBot.define do
  factory :report do
    profile { create(:profile) }
    wpt_id { Faker::Number.number(digits: 10) }
    status { 200 }
    data { Faker::Json.shallow_json(width: 3, options: { key: 'Books::Lovecraft.deity', value: 'Books::Lovecraft.fhtagn' }) }
    load_time { Faker::Number.number(digits: 10) }
    ttfb { Faker::Number.number(digits: 10) }
    bytes_out { Faker::Number.number(digits: 10) }
    bytes_out_doc { Faker::Number.number(digits: 10) }
    bytes_in { Faker::Number.number(digits: 10) }
    bytes_in_doc { Faker::Number.number(digits: 10) }
    connections { Faker::Number.number(digits: 10) }
    requests_full { Faker::Number.number(digits: 10) }
    requests_doc { Faker::Number.number(digits: 10) }
    render { Faker::Number.number(digits: 10) }
    fully_loaded { Faker::Number.number(digits: 10) }
    dom_ements { Faker::Number.number(digits: 10) }
  end
end
