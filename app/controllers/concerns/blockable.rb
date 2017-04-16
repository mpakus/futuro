# frozen_string_literal: true

module Blockable
  extend ActiveSupport::Concern

  private

  def check_block_permission!(block, user)
    raise ActiveRecord::SecurityError if block.post.author != user
  end
end
