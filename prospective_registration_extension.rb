# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class ProspectiveRegistrationExtension < Radiant::Extension
  version "1.0"
  description "Ermöglicht die Anmeldung von Interessenten für den Beta Dienst auf unserer Seite"
  url "http://yourwebsite.com/prospective_registration"
  
   define_routes do |map|
     map.resources :prospectives
     map.namespace :admin, :member => { :remove => :get } do |admin|
       admin.resources :prospectives
     end
   end
  
  def activate
    Page.send :include, ProspectiveRegistrationTags
    admin.tabs.add "Interessenten Übersicht", "/admin/prospectives", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Prospective Registration"
  end
  
end
