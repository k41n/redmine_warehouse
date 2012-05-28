class StoredItem < ActiveRecord::Base
  unloadable

  has_many :issue_stored_item_assignments, :dependent => :destroy

  validates_uniqueness_of :name
  validates_numericality_of :qty
  validates_numericality_of :price
  validates_presence_of :name

  belongs_to :project
end
