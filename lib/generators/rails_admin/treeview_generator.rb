# encoding: utf-8
module RailsAdmin
  class TreeviewGenerator < Rails::Generators::Base
    class << self
      def source_root
        File.expand_path("../../../../app", __FILE__)
      end
    end

    def copy_views
      copy_file "views/layouts/rails_admin/_navigation.html.haml", "app/views/layouts/rails_admin/_navigation.html.haml"
    end
  end
end

