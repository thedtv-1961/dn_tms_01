module ApplicationHelper
  def title page_title
    base_title = I18n.t "title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def link_to_add_row name, f, association, **args
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render association.to_s.singularize, f: builder
    end
    link_to name, "", class: "add_fields " + args[:class],
      data: {id: id, fields: fields.gsub("\n", "")}
  end

  def index_number index, page
    page.present? ? Settings.per_page_default * (page.to_i - 1) + (index + 1) : index + 1
  end
end
