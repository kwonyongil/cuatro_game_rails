class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :firstcard_1
      t.string :secondcard_1
      t.string :thirdcard_1
      
      t.string :firstcard_2
      t.string :secondcard_2
      t.string :thirdcard_2
      
      t.string :firstcard_3
      t.string :secondcard_3
      t.string :thirdcard_3
      
      t.string :firstcard_4
      t.string :secondcard_4
      t.string :thirdcard_4
      
      t.string :firstcard_5
      t.string :secondcard_5
      t.string :thirdcard_5
      
      t.string :firstcard_6
      t.string :secondcard_6
      t.string :thirdcard_6

      t.timestamps null: false
    end
  end
end
