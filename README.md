# RailsAdmin::Treeview

Tree-style navigation for RailsAdmin.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin-treeview'

And then execute:

    $ bundle

Be sure to have [rails_admin](https://github.com/sferik/rails_admin) gem installed.

## Usage

Configure your model to use Treeview in rails_admin.rb:

    RailsAdmin.config do |config|
      config.model Category do
        treeview true
      end
    end

Note that your model should implement these methods to use Treeview: 
* `roots` class method that returns all root elements;
* `children` instance method that returns all of the object's child items.

Tree could be rendered expanded or collapsed. In order to be able to
change this, copy and edit
`app/views/layouts/rails_admin/_navigation.html.haml` by running a
generator:

    rails g rails_admin:treeview

Now you could pass true of false to the `treeview` helper to render tree
expanded or collapsed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
