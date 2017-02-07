class CampaignsController < ApplicationController
  before_action :authorize

  def create
    @campaign = Campaign.new(name: params[:name])

    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end
end
