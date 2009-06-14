# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def gravatar_url_for(email, options = {})
    return "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(email) + ".jpg"
  end
  
  def pessoa_projetos
    current_users.projetos.all(:order => "Nome")
  end
  
  def class_projeto(projeto)
    if projeto.id.to_s == @id
      :sel
    else
      :unsel
    end
  end
  
  def class_aba(aba)
    @aba
    if aba == @aba
      :sel
    end
  end
  
end
