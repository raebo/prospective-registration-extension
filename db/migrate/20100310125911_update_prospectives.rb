class UpdateProspectives < ActiveRecord::Migration
  def self.up
    add_column :siimby_prospectives, :topic_controlling, :boolean
    add_column :siimby_prospectives, :topic_audit, :boolean
    add_column :siimby_prospectives, :topic_legal_management, :boolean
    add_column :siimby_prospectives, :topic_danger_goods, :boolean
    add_column :siimby_prospectives, :topic_plants, :boolean
    add_column :siimby_prospectives, :topic_other, :text
    
    add_column :siimby_prospectives, :use_saas, :boolean
    add_column :siimby_prospectives, :further_ideas, :text
  end
  
  
  def self.down
    remove_column :siimby_prospectives, :further_ideas
    remove_column :siimby_prospectives, :use_saas
    remove_column :siimby_prospectives, :topic_other
    remove_column :siimby_prospectives, :topic_plants
    remove_column :siimby_prospectives, :topic_danger_goods
    remove_column :siimby_prospectives, :topic_legal_management
    remove_column :siimby_prospectives, :topic_audit
    remove_column :siimby_prospectives, :topic_controlling
    
  end
end