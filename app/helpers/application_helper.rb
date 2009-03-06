# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def gravatar_url_for(email, options = {})
    url_for({
      :gravatar_id => Digest::MD5.hexdigest(email),
      :host => 'secure.gravatar.com',
      :protocol => 'https://',
      :only_path => false,
      :controller => 'avatar.php'}.merge(options))
  end
  
  def pessoa_projetos
    current_users.projetos.all(:order => "Nome")
  end
  
  def class_projeto(projeto)
    if projeto.id.to_s == params[:id]
      :sel
    else
      :unsel
    end
  end
end
