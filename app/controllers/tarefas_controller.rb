class TarefasController < ApplicationController
  layout "principal"
  before_filter :create_menu, :login_required
  
  # GET /tarefas
  # GET /tarefas.xml
  def index
    @tarefas = @projeto.tarefas.all(:order => "DtTermino")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tarefas }
    end
  end
  
  # GET /tarefas/1
  # GET /tarefas/1.xml
  def show
    @tarefa = Tarefa.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tarefa }
    end
  end
  
  # GET /tarefas/new
  # GET /tarefas/new.xml
  def new
    @tarefa = Tarefa.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tarefa }
    end
  end
  
  # GET /tarefas/1/edit
  def edit
    @tarefa = Tarefa.find(params[:id])
    @tarefa.DtInicio = l(@tarefa.DtInicio)
  end
  
  # POST /tarefas
  # POST /tarefas.xml
  def create
    @tarefa = Tarefa.new(params[:tarefa])
    @tarefa.projeto_id = @projeto.id
    
    respond_to do |format|
      if @tarefa.save
        flash[:notice] = 'Tarefa was successfully created.'
        format.html { redirect_to(projeto_tarefas_path(@projeto)) }
        format.xml  { render :xml => @tarefa, :status => :created, :location => @tarefa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tarefa.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /tarefas/1
  # PUT /tarefas/1.xml
  def update
    @tarefa = Tarefa.find(params[:id])
    
    respond_to do |format|
      if @tarefa.update_attributes(params[:tarefa])
        flash[:notice] = 'Tarefa was successfully updated.'
        format.html { redirect_to projeto_tarefas_path(@projeto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tarefa.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /tarefas/1
  # DELETE /tarefas/1.xml
  def destroy
    @tarefa = Tarefa.find(params[:id])
    @tarefa.destroy
    
    respond_to do |format|
      format.html { redirect_to(projeto_tarefas_path(@projeto)) }
      format.xml  { head :ok }
    end
  end
  
  def create_menu
    @projetos = Projeto.find(:all)
    @projeto = Projeto.find(params[:projeto_id])
    @id = params[:projeto_id]
    @aba = :tarefas
  end
end