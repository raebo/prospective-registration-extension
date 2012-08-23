class Admin::ProspectivesController < ApplicationController
  
  def index
    @prospectives = Prospective.find(:all)
  end
  
  #
  # method_name
  def show
    puts "+ + + + + ++ + + + + + + ++ + + + +  ++ + + + REMOTE IP " + request.remote_ip
    @prosp = Prospective.find(params[:id])
  end
  
  #
  # method_name
  def destroy
    Prospective.destroy(Prospective.find(params[:id]))
    flash[:notice] = "Eintrag wurde erfolgreich Gelöscht"
    redirect_to admin_prospectives_path()
  end

  
end