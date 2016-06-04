# frozen_string_literal: true
class Post::Publish
  include ApplicationHelper

  def initialize(post)
    @post = post
  end

  def perform
    content, content_cut = fetch_content
    @post.update(content_cut: content_cut, content: content)
  end

  private

  def fetch_content
    content_cut = render_block(@post.list_of_blocks.first)
    content = []
    @post.list_of_blocks.each do |block|
      content << render_block(block)
    end
    [content.join, content_cut]
  end

  def render_block(block)
    clean_text view.render(post_block_template(block, 'show'), block: block)
  end

  def view
    # 1 ApplicationController.new.render_to_string(partial: 'messages/any', locals: { variable: 'value' })
    # 2 html = ActionView::Base.new(Rails.configuration.paths['app/views']).render(
    #   partial: 'test',
    #   formats: [:html],
    #   handlers: [:erb],
    #   locals: { variable: 'value' }
    # )
    # ActionView::Base.helper_modules.each { |helper| view.extend helper }
    @view ||= ActionView::Base.new(ActionController::Base.view_paths, {}).extend(ApplicationHelper)
  end
end
