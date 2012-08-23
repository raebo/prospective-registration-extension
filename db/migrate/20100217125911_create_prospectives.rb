class CreateProspectives < ActiveRecord::Migration
  def self.up
    create_table :siimby_prospectives, :force => true do |t|
      t.string :comp_name
      t.string :comp_url_prefix
      t.string :comp_country
      t.string :comp_city
      t.string :comp_zip_code
      t.string :comp_address
      t.string :cont_gender
      t.string :cont_name
      t.string :cont_first_name
      t.string :cont_position
      t.string :cont_phone
      t.string :cont_email
      t.text :add_text
      t.timestamps
    end
  end

  def self.down
    drop_table :siimby_prospectives
  end
end
