class ShortendUrlStat < ApplicationRecord
  def self.get_top_countries(shortend_url_id)
    self.where({shortend_url_id: shortend_url_id}).group(:country).count.sort_by {|_key, value| value}.to_h.keys.reverse
  end
end
