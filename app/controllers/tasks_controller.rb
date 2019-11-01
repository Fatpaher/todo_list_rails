class TasksController < ApplicationController
  def new
    @task = Task.new(todo_list_id: params[:todo_list_id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to todo_list_path(params[:todo_list_id])
      flash[:notice] = 'New task was added'
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  private

  def task_params
    params.
      require(:task).
      permit(
        :description,
      ).merge(
      todo_list_id: params[:todo_list_id],
    )
  end
end
