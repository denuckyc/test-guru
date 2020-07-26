module ApplicationHelper
  def current_year
    Time.current.year
  end

  def create_github_link(author_name, repo_name)
    link_to "Автор: #{author_name}", "https://github.com/#{author_name}/#{repo_name}", target: :blank
  end

  def flash_alert(message)
    flash[:alert] = message
  end
end
