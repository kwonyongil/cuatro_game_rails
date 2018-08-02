class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :turn
      t.timestamps null: false
    end
  end
end
