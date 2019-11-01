require 'rails_helper'

RSpec.feature 'user can see his todos with related tasks' do
  scenario 'user create new todo list' do
    user = create(:user)
    todo_lists = create_list(:todo_list, 2, user: user)

    todo_lists.each do |todo_list|
      create_list(:task, 2, todo_list: todo_list)
    end
    target_todo_list = todo_lists.first

    visit root_path(as: user)

    click_on(target_todo_list.title)

    expect(page).to have_content(target_todo_list.title)
    expect(page).to have_no_content(todo_lists.last.title)

    target_todo_list.tasks.each do |task|
      expect(page).to have_content(task.description)
    end
  end
end
