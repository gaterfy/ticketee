FactoryBot.define do
  factory :ticket do
    name { "MyString" }
    description { "MyText" }
    association(:project)
    author { association(:user) }
  end
end
