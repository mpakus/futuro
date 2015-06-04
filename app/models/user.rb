class User < ActiveRecord::Base
  include ActiveUUID::UUID

  before_validation :set_alias
  validates :name, :uri, presence: true
  validates :uri,        uniqueness: true

  protected
  def set_alias
    uri = name.parameterize if uri.blank? && !name.blank?
  end
end
