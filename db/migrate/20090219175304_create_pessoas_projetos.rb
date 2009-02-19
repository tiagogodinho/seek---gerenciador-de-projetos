class CreatePessoasProjetos < ActiveRecord::Migration
  def self.up
    create_table :pessoas_projetos do |t|
      t.references :pessoas
      t.references :projetos
    end
  end

  def self.down
    drop_table :pessoas_projetos
  end
end
