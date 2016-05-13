class Post < ActiveRecord::Base
  include ActiveUUID::UUID
  before_create :set_content_cut

  validates :title, presence: true, length: { maximum: 255 }

  enum access: [:for_everyone, :only_followers, :only_friends, :only_me]

  belongs_to :blog, required: true
  delegate :uri, :name, to: :blog, allow_nil: true, prefix: true

  belongs_to :author, class_name: 'User', foreign_key: :user_id, required: true
  delegate :uri, :name, to: :author, allow_nil: true, prefix: true

  scope :by_author, ->(user) { where(author: user) }
  scope :newests,   -> { order(created_at: :desc) }

  def to_uri
    { blog: blog.uri, id: id }
  end

  private

  def set_content_cut
    return if !content_cut.blank? || content.blank?
    self.content_cut = content.truncate(150)
  end
end
