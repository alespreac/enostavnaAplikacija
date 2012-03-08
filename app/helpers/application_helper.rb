module ApplicationHelper
  
  #return a title on a per-page basic
  def title
    base_title = "Ruby on Rails Tutoria"
    if @title.nil?
      base_title
    else
      "#(base_title) | #{@title}"
    end
    
  end
end
