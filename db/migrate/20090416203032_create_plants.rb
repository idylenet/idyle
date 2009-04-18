class CreatePlants < ActiveRecord::Migration
  def self.up
    create_table :plants do |t|
      t.string :common_name
      t.string :bot_name, :null => true
      t.text :desc, :null => true
      t.integer :spacing, :null => true
      t.float :sowing_depth, :null => true
      t.float :yield_worth, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :plants
  end
end
