class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  include ActiveUUID::UUID

  before_validation :set_alias
  validates :name, :uri, presence: true
  validates :uri,        uniqueness: true, length: { maximum: 255 }
  validates :name,       length: { maximum: 255 }

  protected

  def set_alias
    self.uri = name.parameterize if uri.blank? && !name.blank?
  end
end
