class AccountController < ApplicationController
  layout "principal"
  before_filter :create_menu, :login_required
  
  # GET /account
  def index
    @pessoa = current_users
  end
  
  # PUT /account
  # PUT /account.xml
  def update
    @pessoa = current_users

    respond_to do |format|
      if @pessoa.update_attributes(params[:pessoa])
        flash[:notice] = 'Pessoa was successfully updated.'
        if @projeto.nil?
          format.html { redirect_to(@pessoa) }
        else
          format.html { redirect_to(projeto_pessoa_path(@projeto, @pessoa)) }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_menu
    begin
      @projeto = Projeto.find(params[:projeto_id])
    rescue ActiveRecord::RecordNotFound
      @projeto = nil
    end
    
    @projetos = Projeto.find(:all)
    @id = params[:projeto_id]
    #@aba = "pessoas"
  end
end