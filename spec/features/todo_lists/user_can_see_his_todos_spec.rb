require 'rails_helper'

RSpec.feature 'user can see his todos with related tasks' do
  scenario 'user create new todo list' do
    user = create(:user)
    todo_lists = create_list(:todo_list, 2, user: user)

    todo_lists.each do |todo_list|
      create_list(:task, 2, todo_list: todo_list)
    end

    other_todo = create(:todo_list, user: create(:user))

    visit root_path(as: user)

    expect(page).to have_content('Your todo lists')

    todo_lists.each do |todo_list|
      expect(page).to have_content(todo_list.title)
      todo_list.tasks.each do |task|
        expect(page).to have_content(task.description)
      end
    end
    expect(page).to have_no_content(other_todo.title)
  end
end
