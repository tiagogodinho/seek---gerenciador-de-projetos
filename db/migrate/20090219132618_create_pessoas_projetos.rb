class CreatePessoasProjetos < ActiveRecord::Migration
  def self.up
    create_table :pessoas_projetos, :id => false do |t|
      t.integer :pessoa_id, :null => false
      t.integer :projeto_id, :null => false
    end
  end

  def self.down
    drop_table :pessoas_projetos
  end
end
