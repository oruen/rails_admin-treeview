# encoding: utf-8
module RailsAdminTreeviewHelper
  def treeview open = false
    if @model_config && @model_config.treeview
      raise "Your #{@abstract_model.model} model must implement `roots` class method and `children` instance method to use treeview." if
        !@abstract_model.model.respond_to?(:roots) || !@abstract_model.model.public_instance_methods.include?("children")
      res = ''
      res << javascript_include_tag("jquery.treeview.js")
      res << stylesheet_link_tag("jquery.treeview.css")
      res << "<hr>"
      res << "<h3>%s</h3>" % @model_config.label_plural
      res << (content_tag :ul, :id => "treeview" do
        @abstract_model.model.roots.map do |root|
          treeview_draw(root, open)
        end.join.html_safe
      end)
      res << javascript_tag('$(document).ready(function(){$("#treeview").treeview({persist: "location"});});')
      res.html_safe
    end
  end

  def treeview_draw node, open
    content_tag :li, :class => open ? nil : "closed" do
      res = ''
      name = RailsAdmin.config(node.class).with(:object => node).object_label
      res << content_tag(:span, link_to_unless_current(name, { :action => "edit",
                                                :id => node.id,
                                                :host => request.host,
                                                :port => request.port == 80 ? nil : request.port,
                                                :protocol => request.scheme }))
      if node.children.size > 0
        res << (content_tag :ul do
          node.children.map do |child|
            treeview_draw(child, open)
          end.join.html_safe
        end)
      end
      res.html_safe
    end
  end
end
