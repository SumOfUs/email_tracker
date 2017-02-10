class ApplicationController < ActionController::API
  def authorize
    true
  end

  def find_campaign
    @campaign = Campaign.find_by!(uid: params[:campaign_id])
  end
end
