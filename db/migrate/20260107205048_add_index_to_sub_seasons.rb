class AddIndexToSubSeasons < ActiveRecord::Migration[8.1]
  def change
    add_index :sub_seasons, [:year, :subtype], unique: true
  end
end
