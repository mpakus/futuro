# frozen_string_literal: true

FactoryGirl.define do
  factory :post do
    title   { Faker::Lorem.sentence(5) }
    content { Faker::Lorem.sentence(50) }
    access :for_everyone
    blog
    author { create(:user) }
  end
end

# == Schema Information
#
# Table name: posts
#
#  access      :integer
#  blog_id     :integer
#  content     :text(4294967295)
#  content_cut :text(65535)
#  created_at  :datetime         not null
#  header      :string(255)
#  id          :integer          not null, primary key
#  title       :string(255)
#  token       :string(24)
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_posts_on_access   (access)
#  index_posts_on_blog_id  (blog_id)
#  index_posts_on_token    (token)
#  index_posts_on_user_id  (user_id)
#
