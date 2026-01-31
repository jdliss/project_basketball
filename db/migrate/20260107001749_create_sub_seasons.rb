class CreateSubSeasons < ActiveRecord::Migration[8.1]
  def change
    create_table :sub_seasons do |t|
      t.integer :year
      t.date :start_date
      t.date :end_date
      t.string :subtype
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
