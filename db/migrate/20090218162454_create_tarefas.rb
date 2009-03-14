class CreateTarefas < ActiveRecord::Migration
  def self.up
    create_table :tarefas do |t|
      t.string :Nome
      t.text :Descricao
      t.date :DtInicio
      t.date :DtTermino
      t.integer :Prioridade
      t.boolean :Status
      t.integer :Progresso
      t.references :projeto

      t.timestamps
    end
  end

  def self.down
    drop_table :tarefas
  end
end
