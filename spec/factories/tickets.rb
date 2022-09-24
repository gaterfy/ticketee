FactoryBot.define do
  factory :ticket do
    name { "MyString" }
    description { "MyText" }
    association(:project)
    author { association(:user) }

    trait :admin do
      admin { true }
    end
  end
end
