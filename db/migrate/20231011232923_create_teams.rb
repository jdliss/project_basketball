class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :name
      t.string :abbrev
      t.boolean :active
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
