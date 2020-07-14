module ApplicationHelper
  def current_year
    Time.current.year
  end

  def create_github_link(author_name, repo_name)
    link_to "Автор: #{author_name}", "https://github.com/#{author_name}/#{repo_name}"
  end
end
