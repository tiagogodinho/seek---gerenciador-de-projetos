class Pessoa < ActiveRecord::Base
	has_many :pessoasprojetos
	has_many :projetos, :through => :pessoasprojetos
end