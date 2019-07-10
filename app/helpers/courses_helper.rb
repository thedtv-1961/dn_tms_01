module CoursesHelper
  def display_error(field)
    if @course.error[field]
      raw @course.errors[field].first
    end
  end
end
