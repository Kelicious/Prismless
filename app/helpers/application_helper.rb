module ApplicationHelper
  def full_title(page_title)
    base_title = "Unprismatic"
    if page_title && page_title.length > 0
      "#{base_title} | #{page_title}"
    else
      base_title
    end
  end
end
