class ProspectiveObserver < ActiveRecord::Observer
  
   def after_create(user)  
     ProspectiveMailer.deliver_team_new_prospective_email(user)  
     ProspectiveMailer.deliver_welcome_prospective_email(user)  
   end
end 