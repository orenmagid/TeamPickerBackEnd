class CreateNbaPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :nba_players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :person_id
      t.string :position
      t.string :height_feet
      t.string :height_inches
      t.integer :pie
      t.integer :team_id

      t.timestamps
    end
  end
end
