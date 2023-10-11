class Season < ApplicationRecord
  validates :season_id, :name, presence: true
end
