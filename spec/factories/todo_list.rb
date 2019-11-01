FactoryBot.define do
  factory :todo_list do
    sequence(:title) { |n| "title#{n}" }
  end
end
