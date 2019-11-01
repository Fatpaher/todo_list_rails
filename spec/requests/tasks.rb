require 'rails_helper'

RSpec.describe 'todo_lists/:id/tasks' do
  describe 'get /tasks/new' do
    it 'returns form for new task' do
      user = create(:user)
      sign_in_as(user)
      todo_list = create(:todo_list, user: user)

      get("/todo_lists/#{todo_list.id}/tasks/new")

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /tasks' do
    context 'task is valid' do
      it 'creates task new task' do
        user = create(:user)
        sign_in_as(user)
        todo_list = create(:todo_list, user: user)

        task_attr = attributes_for(:task)

        params = {
          task: task_attr
        }

        expect do
          post("/todo_lists/#{todo_list.id}/tasks/", params: params)
        end.to change(Task, :count).by(1)

        expect(Task.last).to have_attributes(
          todo_list_id: todo_list.id,
          description: task_attr[:description],
        )
      end
    end

    context 'task is invalid' do
      it "doesn't create new todo list" do
        user = create(:user)
        sign_in_as(user)
        todo_list = create(:todo_list, user: user)

        task_attr = attributes_for(:task, description: '')

        params = {
          task: task_attr
        }

        expect do
          post("/todo_lists/#{todo_list.id}/tasks/", params: params)
        end.not_to change(Task, :count)
      end
    end
  end
end
