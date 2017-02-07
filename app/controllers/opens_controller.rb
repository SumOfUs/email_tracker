class OpensController < ApplicationController
  before_action :find_campaign

  def track
    Open.track(@campaign, recipient_id: params[:recipient_id])
  end


  private

  def find_campaign
    @campaign = Campaign.find_by!(uid: params[:campaign_id])
  end
end
