class Blog < ActiveRecord::Base
  include ActiveUUID::UUID

  before_validation :set_uri_from_name

  validates :name, :uri, presence: true
  validates :name, length: { maximum: 255 }
  validates :uri,  uniqueness: true, length: { maximum: 255 }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id

  enum variant: [:personal, :community]

  private

  def set_uri_from_name
    return if !uri.blank? || name.blank?
    self.uri = name.parameterize
  end
end
