module ApplicationHelper
  def full_title(title = "")
    unless title.empty?
      return [title, "Surrey Ladies XC League"].join(" | ")
    end
    "Surrey Ladies XC League"
  end
end
