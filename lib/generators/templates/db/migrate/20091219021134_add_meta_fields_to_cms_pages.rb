class AddMetaFieldsToCMSPages < ActiveRecord::Migration
  def self.up
    add_column :cms_pages, :meta_keywords, :string
    add_column :cms_pages, :meta_description, :string
  end

  def self.down
  end
end
