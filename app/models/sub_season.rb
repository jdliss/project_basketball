class SubSeason < ApplicationRecord
  VALID_SUBTYPES = [
    'Preseason', 'Regular Season', 'Postseason', 'Play-In Season'
  ].freeze

  validates :year, :start_date, :end_date, :subtype, presence: true
  validates :subtype, uniqueness: {
    scope: :year,
    message: 'Only one %{value} is permitted per year'
  }
  validates :subtype, inclusion: {
    in: VALID_SUBTYPES,
    message: '%{value} is not permitted'
  }

  belongs_to :season
end
