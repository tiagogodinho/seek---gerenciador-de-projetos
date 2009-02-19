class Projeto < ActiveRecord::Base
  has_and_belongs_to_many :pessoas
  has_many :tarefas
end
