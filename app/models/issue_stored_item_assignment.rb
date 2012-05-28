class IssueStoredItemAssignment < ActiveRecord::Base
  unloadable

  belongs_to :stored_item
  belongs_to :issue
end
