class PessoasController < ApplicationController
  layout "principal", :except => :new
  before_filter :create_menu
  before_filter :login_required, :except => [:create, :new]
  
  # GET /pessoas
  # GET /pessoas.xml
  def index
  	@pessoas = Pessoa.find(:all)
  	
	if @projeto.nil?
      @pessoas = Pessoa.find(:all)
    else
      @pessoas = @projeto.pessoas
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pessoas }
    end
end

  # GET /pessoas/1
  # GET /pessoas/1.xml
  def show
    @pessoa = Pessoa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pessoa }
    end
  end

  # GET /signup
  # GET /signup.xml
  def new
    @pessoa = Pessoa.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pessoa }
    end
  end
  
  # GET /projetos/1/pessoas/invite
  # GET /projetos/1/pessoas/invite.xml
  def invite
  end
  
  # POST /projetos/1/pessoas/send_invite
  # POST /projetos/1/pessoas/send_invite.xml
  def send_invite
    @projeto = Projeto.find(params[:projeto_id])
    @nome = params[:Nome]
    @email = params[:Email]
    PessoasMailer.deliver_invite(@nome, @email, @projeto)
    redirect_to projeto_pessoas_path(@projeto)
  end

  # POST /pessoas
  # POST /pessoas.xml
  def create
    @pessoa = Pessoa.new(params[:pessoa])
    respond_to do |format|
      if @pessoa.save
        self.current_users = @pessoa
          flash[:notice] = 'Pessoa was successfully created.'
          format.html { redirect_back_or_default projetos_path }
          format.xml  { render :xml => @pessoa, :status => :created, :location => @pessoa }
      else
        format.html { redirect_back_or_default projetos_path }
        format.html { render :action => "new" }
        format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /account
  def edit
    @pessoa = current_users
  end

  # PUT /pessoas/1
  # PUT /pessoas/1.xml
  def update
    @pessoa = Pessoa.find(params[:id])

    respond_to do |format|
      if @pessoa.update_attributes
        flash[:notice] = 'Pessoa was successfully updated.'
        format.html { redirect_to account_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # POST /pessoas/1/change_password
  # POST /pessoas/1/change_password.xml
  def change_password
    @pessoa = Pessoa.authenticate(current_users.Login, params[:password_old])
    
    #@pessoa.Nome = 'Godinho'
    
    respond_to do |format|
      if @pessoa
        #if params[:password] == params[:password_confirmation]
          if @pessoa.update_attributes( { :password => params[:password], :password_confirmation => params[:password_confirmation] } )
          #if @pessoa.update_attribute(:password, params[:password])
            flash[:notice] = 'Nova senha cadastrada com sucesso'
            format.html { redirect_to account_path }
            format.xml  { head :ok }
          else
            flash[:notice] = 'Não foi possível cadastrar uma nova senha'
            format.html { redirect_to account_path }
            format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
          end
        #else
          #flash[:notice] = 'Senhas diferentes'
          #format.html { redirect_to account_path }
          #format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
        #end
      else
        flash[:notice] = 'Senha atual incorreta'
        format.html { redirect_to account_path }
        format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.xml
  def destroy
    @pessoa = Pessoa.find(params[:id])
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to(pessoas_url) }
      format.xml  { head :ok }
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
    @aba = "pessoas"
  end
end
