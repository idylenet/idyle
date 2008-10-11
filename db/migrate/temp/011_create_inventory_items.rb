class CreateInventoryItems < ActiveRecord::Migration
  def self.up
    create_table :inventory_items do |t|
      t.references :inventory
      t.references :item

      t.timestamps
    end
  end

  def self.down
    drop_table :inventory_items
  end
end
