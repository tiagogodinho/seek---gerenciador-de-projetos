class CreateProjetos < ActiveRecord::Migration
  def self.up
    create_table :projetos do |t|
      t.string :Nome
      t.date :DtInicio
      t.date :DtTermino
      t.float :Orcamento

      t.timestamps
    end
  end

  def self.down
    drop_table :projetos
  end
end
