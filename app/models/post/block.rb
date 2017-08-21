# frozen_string_literal: true

class Post::Block < ActiveRecord::Base
  belongs_to :post, required: true
  belongs_to :blockable, polymorphic: true
  acts_as_list scope: :post

  KINDS = %w[text album].freeze
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
