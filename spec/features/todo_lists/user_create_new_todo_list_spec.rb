require 'rails_helper'

RSpec.feature 'user can create new todo_list' do
  scenario 'user create new todo list' do
    user = create(:user)
    todo_list = build(:todo_list)

    visit root_path(as: user)

    click_on 'New Todo'

    expect(page).to have_content('New todo list')

    fill_in('todo_list_title', with: todo_list.title)
    click_on('Save')

    expect(page).to have_content('New todo list successfully created')
    expect(page).to have_content(todo_list.title)
  end
end
