class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include ActiveUUID::UUID

  before_validation :set_alias
  validates :name, :uri, presence: true
  validates :uri,        uniqueness: true

  protected
  def set_alias
    uri = name.parameterize if uri.blank? && !name.blank?
  end
end
