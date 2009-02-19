class PessoasProjetos < ActiveRecord::Base
	belongs_to :pessoas
	belongs_to :projetos
end