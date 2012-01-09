require "rails_admin-treeview/version"
require "rails_admin"
require "rails_admin-treeview/config/model"

module RailsAdmin
  module Treeview
    class Engine < Rails::Engine
      initializer 'rails_admin-treeview.helper' do |app|
        ActionView::Base.send :include, RailsAdminTreeviewHelper
      end
    end
  end
end

