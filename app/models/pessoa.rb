class Pessoa < ActiveRecord::Base
	has_many :participantes
	has_many :projetos, :through => :participantes
end