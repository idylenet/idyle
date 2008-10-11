class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.references :user
      t.references :group

      t.timestamps
    end
  end

  def self.down
    drop_table :user_groups
  end
end
