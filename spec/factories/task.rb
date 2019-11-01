FactoryBot.define do
  factory :task do
    sequence(:description) { |n| "desc#{n}" }
  end
end
