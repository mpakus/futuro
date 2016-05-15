module ApplicationHelper
  def form_errors(form)
    html = ''
    if form && form.errors.any?
      html << '<div class="alert-danger alert"><a class="close" data-dismiss="alert">&times;</a><ul>'
      form.errors.each do |field, msg|
        html << %(<li>#{field} #{msg}</li>)
      end
      html << '</ul></div>'
    end
    html.html_safe
  end

  def flash_message(flash)
    html = ''
    flash.each do |name, msg|
      next if !msg.is_a?(String) && msg.blank? && name.blank?
      html << %(
        <div class="alert alert-#{name.to_s == 'notice' ? 'success' : 'danger'}">
          <a class="close" data-dismiss="alert">&times;</a>
          #{content_tag(:div, msg, id: "flash_#{name}")}
        </div>
      )
    end
    html.html_safe
  end

  def title(title)
    content_for :title, strip_tags(title)
  end
end
