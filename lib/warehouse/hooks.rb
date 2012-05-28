module Warehouse
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_edit_notes_bottom, :partial => 'hooks/warehouse/view_issues_edit_notes_bottom'
    render_on :view_issues_show_description_bottom, :partial => 'hooks/warehouse/view_issues_show_description_bottom'
  end
end