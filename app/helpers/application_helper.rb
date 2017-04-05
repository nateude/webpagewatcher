module ApplicationHelper
  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '') # Method def, optional arg
    base_title = 'Web Page Watcher' # Variable assignment
    unless page_title.empty? # Boolean test
      base_title = page_title + ' | ' + base_title # String concatenation
    end
    Rails.env + ' | ' + base_title unless Rails.env.production?
  end
end
