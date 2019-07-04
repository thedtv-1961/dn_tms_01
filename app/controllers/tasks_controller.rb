class TasksController < ApplicationController
  before_action :load_task, only: %i(edit update destroy)

  def index
    @tasks = Task.newest.paginate page: params[:page],
      per_page: Settings.per_page_default
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      flash[:success] = t "messages.save_success"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update_attributes task_params
      flash[:success] = t "messages.update_success"
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      render json: {msg: t("messages.destroy_success"), cls: "success"}
    else
      render json: {msg: t("messages.destroy_error"), cls: "danger"}
    end
  end

  private

  def task_params
    params.require(:task).permit :name
  end

  def load_task
    @task = Task.find_by id: params[:id]
    redirect_to tasks_path unless @task
  end
end
