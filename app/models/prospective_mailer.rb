#encoding: utf-8

class ProspectiveMailer < ActionMailer::Base 
  
  #
  # Diese E-Mail erhält der Interessent nach einer Anmeldung bei uns auf der Seite
  def welcome_prospective_email(prosp)
    
    recipients prosp.cont_email
    # from "boris.raeschler@gmx.de"
    from "Siimbyant Kundenservice <kundenservice@siimbyant.de>"
    subject "Bestätigung Ihrer Registrierung"
    sent_on Time.now 
    # @body[:prospective] = prosp
    content_type "multipart/alternative"

    # part 'multipart/related' do |p|
    #       p.content_type = "text/html" 
    #       p.part :content_type => 'text_html', :body => render_message("welcome_prospective_email_html", :prospective => prosp)      
    #       p.part :content_type =>  :content_type => "image/png", :body => File.read("public/images/new_layout/sp_bg_headline.png") 
    #     end
    
    part "text/html" do |p|
      p.body = render_message("welcome_prospective_email_html", :prospective => prosp)
    end
    
    part "text/plain" do |p|
      p.body = render_message("welcome_prospective_email_plain", :prospective => prosp)
    end
    
#    attachment :content_type => "image/png", :body => File.read("public/images/new_layout/sp_bg_headline.png") 

  end


  def team_new_prospective_email(prosp)
    recipients "boris.raeschler@siimbyant.de"
    from "Siimbyant Kundenservice <kundenservice@siimbyant.de>"
    subject "Registrierung eines neuen Interessenten auf der Homepage"
    sent_on Time.now 
    content_type "multipart/alternative"
    
    part "text/plain" do |p|
      p.body = render_message("team_new_prospective_plain", :prospective => prosp)
    end
  end
end 
