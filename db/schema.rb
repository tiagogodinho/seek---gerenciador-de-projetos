# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090219175304) do

  create_table "pessoas", :force => true do |t|
    t.string   "Nome"
    t.string   "Email"
    t.string   "Senha"
    t.datetime "UltimoAcesso"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "pessoas_projetos" because of following ActiveRecord::StatementInvalid
#   Mysql::Error: Can't create/write to file 'C:\WINDOWS\TEMP\#sql_148_0.MYD' (Errcode: 13): describe `pessoas_projetos`

  create_table "projetos", :force => true do |t|
    t.string   "Nome"
    t.date     "DtInicio"
    t.date     "DtTermino"
    t.float    "Orcamento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tarefas", :force => true do |t|
    t.string   "Nome"
    t.text     "Descricao"
    t.date     "DtInicio"
    t.date     "DtTermino"
    t.integer  "Prioridade"
    t.boolean  "Status"
    t.integer  "Progresso"
    t.integer  "projeto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
