FactoryBot.define do
  factory :todo_list do
    user
    sequence(:title) { |n| "title#{n}" }
  end
end
