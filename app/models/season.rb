class Season < ApplicationRecord
  validates :year, :display_name, presence: true
  validates :year, uniqueness: true

  has_many :sub_seasons

  def preseason
    sub_seasons.find_by(subtype: 'Preseason')
  end

  def regular_season
    sub_seasons.find_by(subtype: 'Regular Season')
  end

  def post_season
    sub_seasons.find_by(subtype: 'Postseason')
  end
  alias playoffs post_season

  def start_date
    preseason.start_date
  end

  def end_date
    post_season.end_date
  end
end
