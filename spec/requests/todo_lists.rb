require 'rails_helper'

RSpec.describe '/todo_lists' do
  describe 'GET /todo_lists' do
    it 'returns list of user todo_lists' do
      user = create(:user)
      user_todo_lists = create_list(:todo_list, 2, user: user)
      other_todo_list = create(:todo_list)
      sign_in_as(user)

      get('/todo_lists')

      expect(response).to have_http_status(:ok)
      user_todo_lists.each do |todo_list|
        expect(response.body).to include(todo_list.title)
      end

      expect(response.body).not_to include(other_todo_list.title)
    end
  end

  describe 'get /todo_lists/new' do
    it 'returns form for new todo_list' do
      sign_in_as(create(:user))

      get('/todo_lists/new')

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /todo_lists' do
    context 'todo_list is valid' do
      it 'creates user new todo_list' do
        user = create(:user)
        sign_in_as(user)

        todo_list_attr = attributes_for(:todo_list)

        params = {
          todo_list: todo_list_attr
        }

        expect do
          post('/todo_lists', params: params)
        end.to change(TodoList, :count).by(1)

        expect(TodoList.last).to have_attributes(
          user_id: user.id,
          title: todo_list_attr[:title],
        )
      end
    end

    context 'todo_list is invalid' do
      it "doesn't create new todo list" do
        user = create(:user)
        sign_in_as(user)

        todo_list_attr = attributes_for(:todo_list, title: '')

        params = {
          todo_list: todo_list_attr
        }

        expect do
          post('/todo_lists', params: params)
        end.not_to change(TodoList, :count)
      end
    end
  end
end
