class CreateComparisons < ActiveRecord::Migration[5.2]
  def change
    create_table :comparisons do |t|
      t.integer :user_id
      t.integer :rater_id
      t.integer :nba_player_id
      t.integer :group_id
      t.string :offrtg
      t.string :dfrtg
      t.string :pie
      t.string :usg

      t.timestamps
    end
  end
end
