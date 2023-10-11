class Team < ApplicationRecord
  belongs_to :season

  validates :team_id, :name, :abbrev, :active, presence: true
end
