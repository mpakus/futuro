# frozen_string_literal: true
class Post < ActiveRecord::Base
  include Tokenized

  before_create :set_content_cut

  acts_as_taggable

  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :blog, required: true
  delegate :uri, :name, to: :blog, allow_nil: true, prefix: true

  belongs_to :author, class_name: 'User', foreign_key: :user_id, required: true
  delegate :uri, :name, to: :author, allow_nil: true, prefix: true

  has_many :blocks, -> { order(position: :asc) }, class_name: 'Post::Block', foreign_key: :post_id

  enum access: [:for_everyone, :only_followers, :only_friends, :only_me]

  scope :by_author, ->(user) { where(author: user) }
  scope :newests, -> { order(created_at: :desc) }

  def to_uri
    { blog: blog.uri, id: id }
  end

  private

  def set_content_cut
    return if !content_cut.blank? || content.blank?
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
#  id          :integer          not null, primary key
#  title       :string(255)
#  token       :string(24)
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_posts_on_access  (access)
#  index_posts_on_token   (token)
#
