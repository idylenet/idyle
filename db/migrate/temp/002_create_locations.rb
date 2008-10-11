class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name, :null => false
      t.string :line1, :line2
      t.string :country, :null => false
      t.string :region, :null => false
      t.string :city, :null => false
      t.string :zipcode

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
