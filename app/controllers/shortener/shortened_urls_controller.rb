class Shortener::ShortenedUrlsController < ActionController::Metal
  include ActionController::StrongParameters
  include ActionController::Redirecting
  include ActionController::Instrumentation
  include Rails.application.routes.url_helpers
  include Shortener

  def show
    token = ::Shortener::ShortenedUrl.extract_token(params[:id])
    result = ::Shortener::ShortenedUrl.find_by_unique_key(token)
    track = Shortener.ignore_robots.blank? || request.human?
    url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params, track: track)
    ip_result = Geocoder.search(request.ip)
    begin
      ShortendUrlStat.create({ip: request.ip, country: ip_result.first.country, shortend_url_id: result.id})
    rescue
    end
    if url[:url] == "/"
      render 404.html
    end
    redirect_to url[:url], status: :moved_permanently
  end
end
