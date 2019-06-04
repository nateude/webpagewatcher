module ContentHelper
  def page_title(page_title)
    content_for(:page_title) { page_title }
  end

  def page_description(page_description)
    content_for(:page_description) { page_description }
  end

  def override_js(override_js)
    content_for(:override_js) { override_js }
  end

  def sub_nav(sub_nav)
    content_for(:sub_nav) { sub_nav }
  end
end
