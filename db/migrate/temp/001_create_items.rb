class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :desc
      t.float :deposit
      t.float :daily_fee
      t.integer :rental_limit
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
