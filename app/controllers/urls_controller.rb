class UrlsController < ApplicationController
  before_action :find_campaign

  def track
    UrlClick.track(@campaign, recipient_id: params[:recipient_id], url: params[:url])
    redirect_to params[:url]
  end
end
