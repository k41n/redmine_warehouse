class IssueStoredItemAssignmentsController < ApplicationController
  unloadable

  def create
    @issue = Issue.find(params[:issue_stored_item_assignment][:issue_id])
    @stored_item = StoredItem.find(params[:issue_stored_item_assignment][:stored_item_id])
    @assignment = IssueStoredItemAssignment.create(:issue => @issue, :stored_item => @stored_item)
    redirect_to issue_path(@issue)
  end

  def destroy
    @assignment = IssueStoredItemAssignment.find(params[:id])
    @assignment.destroy
    redirect_to issue_path(@assignment.issue)
  end

end