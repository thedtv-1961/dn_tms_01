class CoursesController < ApplicationController
  before_action :load_course, only: %i(edit update destroy)

  def index
    @courses = Course.newest.paginate page: params[:page],
      per_page: Settings.per_page_default
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "messages.save_success"
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "messages.update_success"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      render json: {msg: t("messages.destroy_success"), cls: "success"}
    else
      render json: {msg: t("messages.destroy_error"), cls: "danger"}
    end
  end

  private

  def course_params
    params.require(:course).permit :name, :description, :duration,
      :duration_type, :picture
  end

  def load_course
    @course = Course.find_by id: params[:id]
    redirect_to courses_path unless @course
  end
end
