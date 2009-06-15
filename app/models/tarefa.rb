class Tarefa < ActiveRecord::Base
  belongs_to :projeto
  has_many :comments
end
