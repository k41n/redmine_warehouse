class StoredItemsController < ApplicationController
  unloadable

  before_filter :find_project, :only => [:index, :new, :create]
  before_filter :find_stored_item, :only => [:show, :edit, :update, :destroy]

  def new
    @stored_item = StoredItem.new
  end

  def create
    @stored_item = StoredItem.new(pass(params[:stored_item], %w(name qty price)))
    @stored_item.project = @project
    if @stored_item.save
      redirect_to :action => :index, :project_id => @project.id
    else
      render :action => :new
    end
  end

  def update
    @stored_item.update_attributes(pass(params[:stored_item], %w(name qty price)))
    if @stored_item.save
      redirect_to :action => :index, :project_id => @project.id
    else
      render :action => :edit
    end
  end

  def destroy
    @stored_item.destroy
    redirect_to :action => :index, :project_id => @stored_item.project.id
  end

  def add_to_issue
    @issue = Issue.find(params[:issue_id])
    @issue_assignment = IssueStoredItemAssignment.new
  end

private
  # Protection against mass-assignment by means of modified form
  def pass(hash, allowed_keys)
    ret = {}
    hash.each do |k,v|
      ret[k] = v if allowed_keys.include? k
    end
    ret
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_stored_item
    @stored_item = StoredItem.find(params[:id])
  end
end
