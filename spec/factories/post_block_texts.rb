# frozen_string_literal: true

FactoryGirl.define do
  factory :post_block_text, class: 'Post::Block::Text' do
    content { Faker::Lorem.sentences(5) }
  end
end

# == Schema Information
#
# Table name: post_block_texts
#
#  content    :text(4294967295)
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime         not null
#
