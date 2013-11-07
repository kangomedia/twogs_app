class TasksController < ApplicationController
  before_filter :load_taskable
  
  
  def new
    @tasks = @taskable.tasks.new
  end
  
  def create
    @task = @taskable.tasks.new(task_params)
    if @task.save
      respond_to do |format|
        format.html{ redirect_to @taskable }
        format.js
      end
    else
      render :new
    end
  end
  
  def complete
    @task = @taskable.tasks.find(params[:id])
    @task.completed = true
    if @task.save
      redirect_to @taskable, notice: "Task Completed."
    else
      render :new
    end
  end
  
  def active
    @task = @taskable.tasks.find(params[:id])
    @task.completed = false
    if @task.save
      redirect_to @taskable, notice: "Task Restored."
    else
      render :new
    end
  end
  
  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted."
    redirect_to :back
  end
  
private
  def task_params
    params.require(:task).permit(:name, :due_date, :completed, :user_id)
  end
  
  def load_taskable
    resource, id = request.path.split('/')[1, 2]
    @taskable = resource.singularize.classify.constantize.find(id)
  end
  
end