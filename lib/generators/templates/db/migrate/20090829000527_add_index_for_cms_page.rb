class AddIndexForCmsPage < ActiveRecord::Migration
  def self.up
    add_index(:cms_pages, :slug)
  end

  def self.down
    remove_index(:cms_pages, :slug)
  end
end

