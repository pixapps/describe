FactoryGirl.define do
  factory :book do
    sequence(:name) { |n| "My Book #{n}" }
    description "A description"
  end
end
