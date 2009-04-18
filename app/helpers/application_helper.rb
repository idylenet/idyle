# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(title)
    @title = title
    html = "<h2 id='page_title'>#{title}</h2>"
  end

end
