class ProspectivesController < ApplicationController
  radiant_layout 'start_layout'
  no_login_required

  def new
    panel_title = "Registrierung für die kostenlose Nutzung der Testversion"
    @prospective = Prospective.new
    @prospective.comp_country = "ger"
    @prospective.cont_gender = "m"

    respond_to do |format|
      format.html{}
      format.js{
		    flash[:notice] = "Vielen Dank für Ihre Anmeldung. Wir werden uns bemühen Ihnen sobald wie möglich einen Account einzurichten"

        render :update do |page|
          page.call("createStandardPanel", panel_title, "750px", "1024px")
          page.replace_html "panel_body_id", :partial => "form"
        end
      }
    end
  end


  def create
    @prospective = Prospective.new(params[:prospective])
    @prospective.comp_url_prefix = request.remote_ip

    respond_to do |format|
      format.html{}
      format.js{
        if @prospective.save
          flash[:notice] = "Vielen Dank für Ihre Registrierung. Eine E-Mail mit weiteren Informationen wurde an die angegebene Adresse versendet."

          render :update do |page|
            page.call "hideStandardPanel"
            page.call("createStandardPanel", "Ihre Daten wurden gespeichert", "750px", "200px")
            page.replace_html "panel_body_id", :partial => "after_registration"
            #page.insert_html :bottom, "content_wrapper", :partial => "after_registration"
            page.delay(5) do
              #page.visual_effect :fade, 'notice'
              page.call "hideStandardPanel"
            end
          end
        else
          render :update do |page|
            page.replace_html "panel_body_id", :partial => "form"
            page.call "smoothResize"
          end
        end
      }
    end

  end

end
