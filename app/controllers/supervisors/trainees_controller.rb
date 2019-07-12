class Supervisors::TraineesController < ApplicationController
  def show; end

  def edit
    @users = User.newest
    @course = Course.find_by id: params[:id]
    # @email_users = @course.includes(user_courses, user).pluck :email
    # @course.course_users.build
  end

  def update
    @course = Course.find_by id: params[:id]
    @users = User.newest

    if @course.update_attributes course_user_params
      redirect_to supervisors_courses_path
    else
      render :edit
    end
    # @course.save
  end


  private
  def course_user_params
    params.require(:course).permit :id,  course_users_attributes: [:id, :course_id, :user_id, :_destroy]
  end
end
