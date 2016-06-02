# frozen_string_literal: true
class Blog < ActiveRecord::Base
  include Tokenized

  before_validation :set_uri_from_name
  before_validation :remove_dog

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri, presence: true, uniqueness: true, length: { maximum: 255 }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id, required: true
  has_many :posts, dependent: :destroy

  enum variant: %i(personal community)

  def to_param
    uri
  end

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

# == Schema Information
#
# Table name: blogs
#
#  created_at  :datetime         not null
#  description :text(65535)
#  id          :integer          not null, primary key
#  image       :string(255)
#  name        :string(255)
#  settings    :text(65535)
#  token       :string(24)
#  updated_at  :datetime         not null
#  uri         :string(255)
#  user_id     :integer
#  variant     :integer
#
# Indexes
#
#  index_blogs_on_token  (token)
#  index_blogs_on_uri    (uri)
#
