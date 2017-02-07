class Open < ApplicationRecord
  belongs_to :campaign, counter_cache: true

  validates :campaign_id, :recipient_id, presence: true
  before_save :set_timestamps
  before_save :increment_counter

  class << self
    def track(campaign, recipient_id:)
      open = Open.find_or_initialize_by(campaign: campaign, recipient_id: recipient_id)
      open.save
      open
    end
  end

  private

  def set_timestamps
    unless first_opened_at
      self.first_opened_at = Time.now
    end

    self.last_opened_at = Time.now
  end

  def increment_counter
    self.opens_count += 1
  end
end
