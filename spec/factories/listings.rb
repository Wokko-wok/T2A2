FactoryBot.define do
  factory :listing do
    user { nil }
    species { "MyString" }
    age { 1 }
    price { 1 }
    name { "MyString" }
    description { nil }
    sold { false }
  end
end
