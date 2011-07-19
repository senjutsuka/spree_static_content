class AddVisibleToCmsPages < ActiveRecord::Migration
  def self.up
    add_column :cms_pages, :visible, :boolean
    CmsPage.update_all :visible => true 
  end
 
  def self.down
    remove_column :cms_pages, :visible
  end
end