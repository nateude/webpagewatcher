module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Web Page Watcher'
    base_title = page_title + ' | ' + base_title unless page_title.empty?
    Rails.env + ' | ' + base_title unless Rails.env.production?
  end
end
