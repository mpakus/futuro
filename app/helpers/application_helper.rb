# frozen_string_literal: true
module ApplicationHelper
  def form_errors(form)
    html = []
    if form && form.errors.any?
      html << '<div class="alert-danger alert"><a class="close" data-dismiss="alert">&times;</a><ul>'
      form.errors.each do |field, msg|
        html << %(<li>#{field} #{msg}</li>)
      end
      html << '</ul></div>'
    end
    html.join.html_safe
  end

  def flash_message(flash)
    html = []
    flash.each do |name, msg|
      next if !msg.is_a?(String) && msg.blank? && name.blank?
      html << %(
        <div class="alert alert-#{name.to_s == 'notice' ? 'success' : 'danger'}">
          <a class="close" data-dismiss="alert">&times;</a>
          #{content_tag(:div, msg, id: "flash_#{name}")}
        </div>
      )
    end
    html.join.html_safe
  end

  def title(title)
    content_for :title, strip_tags(title)
  end

  def post_block_template(block, tpl = 'form')
    klass = block.blockable.class.to_s.split('::').last.downcase
    "futuro/posts/blocks/#{klass}/#{tpl}"
  end

  def clean_text(text)
    return '' if text.blank?
    scrubber = Rails::Html::PermitScrubber.new
    scrubber.tags = %w(p b h1 h2 h3 h4 h5 h6 li ul ol small big strong u i img blockquote cite pre span a div table tr td th br)
    scrubber.attributes = %w(href src style class)
    html_fragment = Loofah.fragment(text)
    html_fragment.scrub!(scrubber)
    html_fragment.to_s.html_safe
  end
end
