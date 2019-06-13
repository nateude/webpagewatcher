module ApplicationHelper
  include FlashHelper
  include ContentHelper

  def pretty_print_json(str)
    JSON.pretty_generate(JSON.parse(str.to_s))
  rescue JSON::ParserError
    str
  end
end
