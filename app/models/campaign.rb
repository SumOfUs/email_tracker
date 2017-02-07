class Campaign < ApplicationRecord
  before_create :generate_uid
  has_many :opens

  validates :name, presence: true

  private

  def generate_uid
    self.uid = SecureRandom.hex
  end
end
