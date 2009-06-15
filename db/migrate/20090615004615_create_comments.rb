class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.references :pessoa
      t.references :tarefa

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
