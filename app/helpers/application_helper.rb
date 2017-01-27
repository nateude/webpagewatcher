module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Web Page Watcher"  # Variable assignment
    if !page_title.empty?                             # Boolean test
      base_title = page_title + " | " + base_title    # String concatenation
    end
    if !Rails.env.production?
      base_title = Rails.env + " | " + base_title
    end
  end

end
