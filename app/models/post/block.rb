# frozen_string_literal: true
class Post::Block < ActiveRecord::Base
  belongs_to :post, required: true
  belongs_to :blockable, polymorphic: true
  acts_as_list scope: :post

  KINDS = %w(text).freeze
end
