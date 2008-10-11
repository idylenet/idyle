class CreateOperations < ActiveRecord::Migration
  include OperationsHelper
  def self.up
    create_table :operations do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
    
    
    
  end

  def self.down
    drop_table :operations
  end
end
