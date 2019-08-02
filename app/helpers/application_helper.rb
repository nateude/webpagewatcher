module ApplicationHelper
  include FlashHelper
  include ContentHelper

  def pretty_print_json(str)
    JSON.pretty_generate(JSON.parse(str.to_s))
  rescue JSON::ParserError
    str
  end

  def format_date(date)
    if date.today?
      date.strftime('%R')
    else
      date.strftime('%m/%d')
    end
  end
end
