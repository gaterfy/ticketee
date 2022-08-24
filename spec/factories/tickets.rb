FactoryBot.define do
  factory :ticket do
    name { "MyString" }
    description { "MyText" }
    association(:project)
  end
end
