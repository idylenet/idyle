class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.string :title
      t.references :user
      t.references :location
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
