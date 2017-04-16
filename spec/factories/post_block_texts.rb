# frozen_string_literal: true

FactoryGirl.define do
  factory :post_block_text, class: 'Post::Block::Text' do
    content { Faker::Lorem.sentences(5) }
  end
end
