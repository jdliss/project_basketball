class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :game_id
      t.integer :score
      t.boolean :overtime
      t.boolean :win
      t.datetime :date
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
