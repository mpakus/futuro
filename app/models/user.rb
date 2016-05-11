class User < ActiveRecord::Base
  include ActiveUUID::UUID

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable

  before_validation :set_alias
  validates :name, :uri, presence: true
  validates :uri,        uniqueness: true, length: { maximum: 255 }
  validates :name,       length: { maximum: 255 }

  has_many :blogs, dependent: :destroy
  has_many :posts, dependent: :destroy

  protected

  def set_alias
    self.uri = name.parameterize if uri.blank? && !name.blank?
  end
end
