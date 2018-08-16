class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
