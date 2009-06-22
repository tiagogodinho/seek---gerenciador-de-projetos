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

ActiveRecord::Schema.define(:version => 20090622020550) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "pessoa_id"
    t.integer  "tarefa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "participantes", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "projeto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "Login"
    t.string   "Nome"
    t.string   "Email"
    t.datetime "UltimoAcesso"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pessoas", ["Email"], :name => "index_pessoas_on_Email", :unique => true
  add_index "pessoas", ["Login"], :name => "index_pessoas_on_Login", :unique => true

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
