# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token

  # :lockable, :timeoutable and :omniauthable,
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_validation :set_alias
  validates :name, :uri, presence: true
  validates :uri,        uniqueness: true, length: { maximum: 255 }
  validates :name,       length: { maximum: 255 }

  has_many :blogs, foreign_key: :user_id, primary_key: :id, dependent: :destroy
  has_many :posts, foreign_key: :user_id, dependent: :destroy

  def to_param
    uri
  end

  protected

  def set_alias
    self.uri = name.parameterize if uri.blank? && name.present?
  end
end

# == Schema Information
#
# Table name: users
#
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  name                   :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  token                  :string(24)
#  unconfirmed_email      :string(255)
#  unlock_token           :string(255)
#  updated_at             :datetime         not null
#  uri                    :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_token                 (token)
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
