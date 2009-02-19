class Projeto < ActiveRecord::Base
	has_many :tarefas
	has_many :pessoasprojetos
	has_many :pessoas, :through => :pessoasprojetos
end