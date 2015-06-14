class Post < ActiveRecord::Base
  include ActiveUUID::UUID

  validates :title, presence: true, length: {maximum: 255}

  enum access: [:for_everyone, :only_followers, :only_friends, :only_me]

  belongs_to :blog
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
end
