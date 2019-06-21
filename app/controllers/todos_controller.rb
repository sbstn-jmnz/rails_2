class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :todos_done

  def index
    @todos = current_user.todos
  end

  def show
    todo = Todo.find(params[:todo_id])
    @task = todo.task
    @todos = Todo.where(task_id: @task.id, completed: true)
  end

  def update
    todo = Todo.find(params[:todo_id])
    todo.completed = !todo.completed
    todo.save
    redirect_to todos_path
  end

  private
  def todos_done
   @todos_done_count = current_user.todos.where(completed: true).count
   @tasks_count = Task.all.count
  end
end
