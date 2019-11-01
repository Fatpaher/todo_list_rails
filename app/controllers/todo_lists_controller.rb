class TodoListsController < ApplicationController
  def index
    @todo_lists = current_user.todo_lists.includes(:tasks)
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def new
    @todo_list = current_user.todo_lists.new
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      redirect_to action: :show, id: @todo_list.id
      flash[:notice] = 'New todo list successfully created'
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  private

  def todo_list_params
    params.
      require(:todo_list).
      permit(
        :title,
      )
  end
end
