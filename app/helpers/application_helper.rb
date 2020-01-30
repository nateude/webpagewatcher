module ApplicationHelper
  include FlashHelper
  include ContentHelper
  include LogInHelper

  def pretty_print_json(str)
    JSON.pretty_generate(JSON.parse(str.to_s))
  rescue JSON::ParserError
    str
  end

  def format_date(date)
    date.strftime('%m/%d %R')
  end

  def enable_manual_update?
    WebPageTestConfig.manual_update
  end
end
