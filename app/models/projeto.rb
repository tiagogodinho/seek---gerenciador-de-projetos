class Projeto < ActiveRecord::Base
	has_many :tarefas
	has_many :participantes
	has_many :pessoas, :through => :participantes
end