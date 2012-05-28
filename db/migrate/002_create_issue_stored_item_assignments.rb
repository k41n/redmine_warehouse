class CreateIssueStoredItemAssignments < ActiveRecord::Migration
  def self.up
    create_table :issue_stored_item_assignments do |t|
      t.references :issue
      t.references :stored_item
    end
  end

  def self.down
    drop_table :issue_stored_item_assignments
  end
end
