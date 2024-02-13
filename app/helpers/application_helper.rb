module ApplicationHelper
  def home_page?
    current_page?(root_path)
  end
end
