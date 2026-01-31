class AddIndexToSeasons < ActiveRecord::Migration[8.1]
  def change
    add_index :seasons, :year, unique: true
  end
end
