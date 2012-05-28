class CreateStoredItems < ActiveRecord::Migration
  def self.up
    create_table :stored_items do |t|
      t.column :name, :string, :limit => 100
      t.column :qty, :integer, :default => 0
      t.column :price, :float
      t.references :project
    end
  end

  def self.down
    drop_table :stored_items
  end
end
