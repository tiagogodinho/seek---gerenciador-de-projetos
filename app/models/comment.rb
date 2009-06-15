class Comment < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :tarefa
end
