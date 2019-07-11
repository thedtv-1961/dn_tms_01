module CoursesHelper

  # Display error message on input field
  def display_error field, custom_field_name = nil
    return unless @course.errors[field].present?
    name = custom_field_name ? custom_field_name : field.to_s.titlecase
    raw "<span class=\"error_message\">  #{name}
      #{@course.errors[field].first}</span>"
  end

  # Active course status
  def active_course_status
    @course.id ? false : true
  end

  # Fill course status color on cell table
  def fill_course_status_color course
    status = Course.status_types
    case course.status
    when status[:init]
      "primary"
    when status[:start]
      "success"
    when status[:finish]
      "default"
    else
      "default"
    end
  end

  # Highlight error tab
  def highlight_error_tab field
    "error-tab" if @course.errors[field].present?
  end
end
