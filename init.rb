require 'redmine'

require_dependency 'warehouse/hooks'

Redmine::Plugin.register :redmine_warehouse do
  name 'Redmine Warehouse demo plugin'
  author 'Andrei Malyshev'
  description 'Exam task'
  version '0.0.1'
  url 'git@github.com:k41n/redmine_warehouse.git'
  author_url 'https://github.com/k41n'
  project_module :stored_items do
    permission :observe_warehouse, { :stored_items => [:index] }
    permission :manage_warehouse, { :stored_items => [:new, :create, :update, :edit, :delete] }
  end
  menu :project_menu, :stored_items, { :controller => 'stored_items', :action => 'index' }, :caption => 'Склад', :after => :files, :param => :project_id
end
