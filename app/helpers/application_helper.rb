module ApplicationHelper
  def this_year
    Date.current.year
  end

  def github_url(author:, repo:, text:)
    link_to text, "https://www.github.com/#{author}/#{repo}"
  end
end
