class Comment < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :tarefa
  
  has_attached_file :image
end
