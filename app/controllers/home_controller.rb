class HomeController < ApplicationController
  def index
  end

  def shorturl
    @result = Shortener::ShortenedUrl.generate(params[:url], owner: nil, expires_at: 1.month.since)
  end
  
  def stats
    @shorturls = ::Shortener::ShortenedUrl.all
  end

end
