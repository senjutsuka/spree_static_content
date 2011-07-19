class AddVisibleToCMSPages < ActiveRecord::Migration
  def self.up
    add_column :cms_pages, :visible, :boolean
    CMSPage.update_all :visible => true 
  end
 
  def self.down
    remove_column :cms_pages, :visible
  end
end