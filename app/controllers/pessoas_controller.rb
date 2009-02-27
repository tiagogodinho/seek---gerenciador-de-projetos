class PessoasController < ApplicationController
  layout "principal"
  before_filter :create_menu
  
  include AuthenticatedSystem
  
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

  # GET /pessoas/new
  # GET /pessoas/new.xml
  def new
    @pessoa = Pessoa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pessoa }
    end
  end

  # GET /pessoas/1/edit
  def edit
    @pessoa = Pessoa.find(params[:id])
  end

  # POST /pessoas
  # POST /pessoas.xml
  def create
    @pessoa = Pessoa.new(params[:pessoa])
    respond_to do |format|
      if @pessoa.save
        self.current_users = @pessoa
        if !@projeto.nil?
          @participante = Participante.new
          @participante.pessoa_id = @pessoa.id
          @participante.projeto_id = @projeto.id
          if @participante.save
            flash[:notice] = 'Pessoa was successfully created.'
            #format.html { redirect_to(@pessoa) }
            format.html { redirect_to(projeto_pessoas_path(@projeto)) }
            format.xml  { render :xml => @pessoa, :status => :created, :location => @pessoa }
          end
        else
          flash[:notice] = 'Pessoa was successfully created.'
          format.html { redirect_to(@pessoa) }
          format.xml  { render :xml => @pessoa, :status => :created, :location => @pessoa }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pessoa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pessoas/1
  # PUT /pessoas/1.xml
  def update
    @pessoa = Pessoa.find(params[:id])

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
