# frozen_string_literal: true

require 'cgi'

module AppHelper
  def escape_html(str)
    CGI.escapeHTML(str)
  end
end
