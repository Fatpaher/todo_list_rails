require 'rails_helper'

RSpec.feature 'user can create new todo_list' do
  scenario 'user create new todo list' do
    user = create(:user)
    todo_list = create(:todo_list, user: user)
    task = build(:task)

    visit root_path(as: user)

    click_on todo_list.title
    click_on 'Create new task'


    fill_in('task_description', with: task.description)
    click_on('Save')

    expect(page).to have_content('New task was added')
    expect(page).to have_content(todo_list.title)
  end
end
