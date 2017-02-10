class UrlClick < ApplicationRecord
  belongs_to :campaign, counter_cache: true

  validates :campaign_id, :recipient_id, :url, presence: true
  before_save :set_timestamps
  before_save :increment_counter

  class << self
    def track(campaign, recipient_id:, url:)
      click = UrlClick.find_or_initialize_by(campaign: campaign, recipient_id: recipient_id, url: url)
      click.save
      click
    end
  end

  private

  def set_timestamps
    unless first_clicked_at
      self.first_clicked_at = Time.now
    end

    self.last_clicked_at = Time.now
  end

  def increment_counter
    self.clicks_count += 1
  end
end
