module ApplicationHelper
  def top_countries(id)
    ShortendUrlStat.get_top_countries(id)
  end
end
