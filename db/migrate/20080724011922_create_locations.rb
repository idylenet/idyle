class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.string :line1
      t.string :line2
      t.string :region
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
