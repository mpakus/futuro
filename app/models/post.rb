# frozen_string_literal: true

class Post < ApplicationRecord
  include Tokenized

  before_create :set_content_cut

  acts_as_taggable
  mount_uploader :header, PostHeaderUploader

  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :blog, required: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id, required: true
  has_many :list_of_blocks, -> { order(position: :asc) }, class_name: 'Post::Block'

  delegate :uri, :name, to: :blog, allow_nil: true, prefix: true
  delegate :uri, :name, to: :author, allow_nil: true, prefix: true

  scope :by_author, ->(user) { where(author: user) }
  scope :newests, -> { order(created_at: :desc) }

  enum access: %i[for_everyone only_followers only_friends only_me]

  def blocks
    list_of_blocks.collect(&:blockable)
  end

  def to_uri
    { blog: blog.uri, id: token }
  end

  private

  def set_content_cut
    return if content_cut.present? || content.blank?
    self.content_cut = content.truncate(150)
  end
end

# == Schema Information
#
# Table name: posts
#
#  access      :integer
#  blog_id     :integer
#  content     :text(4294967295)
#  content_cut :text(65535)
#  created_at  :datetime         not null
#  header      :string(255)
#  id          :integer          not null, primary key
#  title       :string(255)
#  token       :string(24)
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_posts_on_access   (access)
#  index_posts_on_blog_id  (blog_id)
#  index_posts_on_token    (token)
#  index_posts_on_user_id  (user_id)
#
