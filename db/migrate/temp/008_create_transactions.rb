class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.references :item
      t.references :user
      # t.references :operation 
      
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
