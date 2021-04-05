FactoryBot.define do
  factory :client do
    number { 1 }
    name { "MyString" }
    postcode { 1 }

    trait :invalid do
      number { nil }
    end
  end
end
