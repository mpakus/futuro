class Blog < ActiveRecord::Base
  include ActiveUUID::UUID

  before_validation :set_uri_from_name
  before_validation :remove_dog

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri, presence: true, uniqueness: true, length: { maximum: 255 }

  belongs_to :owner,  class_name: 'User', foreign_key: :user_id, required: true
  has_many :posts, dependent: :destroy

  enum variant: [:personal, :community]

  private

  def set_uri_from_name
    return if !uri.blank? || name.blank?
    self.uri = name.parameterize
  end

  def remove_dog
    return if uri.blank?
    uri.gsub('/\@/', '')
  end
end
