FactoryBot.define do
  factory :product do
    title { "MyString" }
    body { "MyString" }

    trait :invalid do
      title { nil }
    end
  end
end
