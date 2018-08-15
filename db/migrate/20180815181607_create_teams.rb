class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :group_id

      t.timestamps
    end
  end
end
