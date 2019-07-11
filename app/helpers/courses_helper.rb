module CoursesHelper
  def display_error(field, custom_field_name = nil)
    return unless @course.errors[field].present?
    name = custom_field_name ? custom_field_name : field.to_s.titlecase
    raw "<span class=\"error_message\">  #{name}
      #{@course.errors[field].first}</span>"
  end
end
