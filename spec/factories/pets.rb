FactoryBot.define do
  factory :pet do
    user { nil }
    species { "MyString" }
    age { 1 }
    price { 1 }
  end
end
