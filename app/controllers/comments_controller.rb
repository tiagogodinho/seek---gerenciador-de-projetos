class CommentsController < ApplicationController
  layout "principal"
  before_filter :create_menu, :login_required
  
  # GET /comments
  # GET /comments.xml
  def index
    @tarefa = Tarefa.find(params[:tarefa_id])
    @comments = @tarefa.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @comment.pessoa_id = current_users.id
    @comment.tarefa_id = params[:tarefa_id]

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to projeto_tarefa_comments_path(@projeto, @tarefa) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to projeto_tarefa_comments_path(@projeto, @tarefa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to projeto_tarefa_comments_path(@projeto, @tarefa) }
      format.xml  { head :ok }
    end
  end
  
  def create_menu
    @projetos = Projeto.find(:all)
    @projeto = Projeto.find(params[:projeto_id])
    @tarefa = Tarefa.find(params[:projeto_id])
    @id = params[:projeto_id]
    @aba = :tarefas
  end
end