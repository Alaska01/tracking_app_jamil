class Movement < ApplicationRecord
  validates :tracking_time, presence: true
  belongs_to :customer
end
