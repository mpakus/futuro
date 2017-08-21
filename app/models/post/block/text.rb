# frozen_string_literal: true

class Post::Block::Text < ActiveRecord::Base
  has_one :post_block, as: :blockable, class_name: 'Post::Block'
  has_one :post, through: :post_block
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
