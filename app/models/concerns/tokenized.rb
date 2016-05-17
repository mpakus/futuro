# frozen_string_literal: true
module Tokenized
  extend ActiveSupport::Concern

  included do
    has_secure_token
  end

  def to_param
    token
  end
end
