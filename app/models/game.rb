class Game < ApplicationRecord
  belongs_to :team

  validates :game_id, :score, :overtime, :win, :date, presence: true
end
