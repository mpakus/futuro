# frozen_string_literal: true

FactoryGirl.define do
  factory :blog do
    name        { Faker::Lorem.sentence(3) }
    uri         { Faker::Lorem.sentence(3).parameterize }
    description { Faker::Lorem.sentence(15) }
    image ''
    settings ''
    owner { create(:user) }
    variant :personal
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
#  index_blogs_on_token    (token)
#  index_blogs_on_uri      (uri)
#  index_blogs_on_user_id  (user_id)
#
