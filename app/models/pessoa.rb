class Pessoa < ActiveRecord::Base
  has_and_belongs_to_many :projetos
end
