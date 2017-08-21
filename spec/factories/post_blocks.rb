# frozen_string_literal: true

FactoryGirl.define do
  factory :post_block, class: 'Post::Block' do
    post
    blockable nil
  end
end

# == Schema Information
#
# Table name: post_blocks
#
#  blockable_id   :integer
#  blockable_type :string(255)
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  position       :integer          default(0)
#  post_id        :integer
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_post_blocks_on_blockable_type_and_blockable_id  (blockable_type,blockable_id)
#  index_post_blocks_on_post_id                          (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
