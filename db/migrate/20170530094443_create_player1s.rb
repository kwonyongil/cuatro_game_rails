class CreatePlayer1s < ActiveRecord::Migration
  def change
    create_table :player1s do |t|
      t.string :firstcard
      t.string :secondcard
      t.string :thirdcard
      t.string :fourthcard
      t.timestamps null: false
    end
  end
end
