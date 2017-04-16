# frozen_string_literal: true

FactoryGirl.define do
  factory :post_block, class: 'Post::Block' do
    post
    blockable nil
  end
end
