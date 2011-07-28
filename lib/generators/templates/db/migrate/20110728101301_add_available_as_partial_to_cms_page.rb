class AddAvailableAsPartialToCmsPage < ActiveRecord::Migration
  def self.up
    add_column :cms_pages, :available_as_partial, :boolean, :default=> true, :null=>false
  end

  def self.down
    remove_column :cms_pages, :available_as_partial
  end
end