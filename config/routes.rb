ActionController::Routing::Routes.draw do |map|
  map.resources :stored_items,
    :collection => {
        :add_to_issue => :get
    }

  map.resources :issue_stored_item_assignments

end