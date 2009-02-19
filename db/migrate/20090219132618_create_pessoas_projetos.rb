class CreatePessoasProjetos < ActiveRecord::Migration
  def self.up
    create_table :pessoas_projetos do |t|
      t.references :pessoa
      t.references :projeto
    end
  end

  def self.down
    drop_table :pessoas_projetos
  end
end
