class AddStatusProspectives < ActiveRecord::Migration
  def self.up
    add_column :siimby_prospectives, :prosp_status, :string
  end
  
  
  def self.down
    remove_column :siimby_prospectives, :prosp_status
  end
end