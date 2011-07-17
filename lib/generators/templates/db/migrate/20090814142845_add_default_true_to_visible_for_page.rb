class AddDefaultTrueToVisibleForCMSPage < ActiveRecord::Migration
  def self.up
    change_column :cms_pages, :visible, :boolean, :default=> true
  end

  def self.down
  end
end