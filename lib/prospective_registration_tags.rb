module ProspectiveRegistrationTags
  include Radiant::Taggable
  
  class TagError < StandardError
  end
  
  desc %{
    
  }
  #<r:new_siimby_prospective link_name="test" div_id="link_zuur_anmeldung" />
  #, css_class="bt_register_now"
  tag "new_siimby_prospective" do |tag|
    
    "<div id=\"#{tag.attr['div_id']}\"><script type=\"text/javascript\">
    function start_prospective_registration(){
      new Ajax.Request(\'/prospectives/new/\',
      {
        method:'get',
        onSuccess: function(transport){
          var response = transport.responseText || \"no response text\";
        },
        onFailure: function(){ alert('Something went wrong...') }
      });
    
    }</script>" + 
    "<a onclick=\"start_prospective_registration()\" href='#'>" + tag.attr['link_name'] + "</a></div>"
    #"<a onclick=\"new Ajax.Request('/prospectives/new', {asynchronous:true, evalScripts:true, method:'get'}); return false;\"" +
    
    #class='" + tag.attr['css_class'] + "'
    
    
  end
  
  
  tag "new_package_booking" do |tag|
    "<div class=\"package_booking_" + tag.attr['link_name'] + "\"><script type=\"text/javascript\">
    function start_package_booking(){
      new Ajax.Request(\'/package/new/\',
      {
        method:'get',
        onSuccess: function(transport){
          var response = transport.responseText || \"no response text\";
        },
        onFailure: function(){ alert('Something went wrong...') }
      });
    
    }</script>" + 
    "<a onclicke=\"start_package_booking()\" href='#'>&nbsp;</a></div>"
    #tag.attr['link_name']
  end
  
  
  tag "new_saas_informations" do |tag|
    "<div class=\"saas_informations\"><script type=\"text/javascript\">
    function start_package_booking(){
      new Ajax.Request(\'/package/new/\',
      {
        method:'get',
        onSuccess: function(transport){
          var response = transport.responseText || \"no response text\";
        },
        onFailure: function(){ alert('Something went wrong...') }
      });
    
    }</script>" + 
    "<a onclicke=\"start_package_booking()\" href='#'>&nbsp;</a></div>"
  end
  
  # ein normaler link wird hier gerendert
  tag "siimby_prospective" do |tag|
    '<div id="' + tag.attr['div_id'] + '"><a href="/prospectives/new/">' + tag.attr['link_name'] + '</a></div>'
  end
end
