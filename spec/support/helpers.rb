# frozen_string_literal: true

module Helpers
  def t(string, options = {})
    I18n.t(string, options)
  end
end
