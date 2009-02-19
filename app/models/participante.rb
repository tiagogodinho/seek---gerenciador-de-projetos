class Participante < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :projeto
end
