class Prospective < ActiveRecord::Base
  set_table_name "siimby_prospectives"
  
  validates_presence_of :comp_name
  #validates_presence_of :comp_url_prefix
  validates_presence_of :comp_country
  #validates_presence_of :comp_city
  #validates_presence_of :comp_zip_code
  #validates_presence_of :comp_address
  
  validates_presence_of :cont_gender
  validates_presence_of :cont_name
  validates_presence_of :cont_first_name
  validates_presence_of :cont_position
  #validates_presence_of :cont_phone
  validates_presence_of :cont_email
  
  before_create :bc_set_initial_status
  
  def display_salutation
    if self.cont_gender == "m"
      return "Sehr geehrter Herr #{self.cont_name},"
    else
      return "Sehr geehrte Frau #{self.cont_name},"      
    end
  end  
  
  def salutation
    if self.cont_gender == "m"
      return "Hr"
    else
      return "Fr"
    end
  end

  def use_saas
   return check_value(@use_saas)
  end
  
  def topic_audit
   return check_value(@topic_audit)
  end

  def topic_legal_management
   return check_value(@topic_legal_management)
  end
  
  def topic_controlling
   return check_value(@topic_controlling)
  end
  
  def topic_danger_goods
   return check_value(@topic_danger_goods)
  end
  
  def topic_plants
   return check_value(@topic_plants)
  end
  
private
  def bc_set_initial_status
    self.prosp_status = "Unbearbeitet"
  end
  
  def check_value value
   if value.blank?
      return "Nein"
    else
      return "Ja"
    end
  end
end