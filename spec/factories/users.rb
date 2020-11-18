FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    uid { "xxx" }
  end
end
