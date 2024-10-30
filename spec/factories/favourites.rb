FactoryBot.define do
  factory :favourite do
    association :user
    association :album
  end
end