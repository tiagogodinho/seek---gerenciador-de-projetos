class CreatePessoas < ActiveRecord::Migration
  def self.up
    create_table :pessoas, :force => true do |t|
      t.string :Login
      t.string :Nome
      t.string :Email
      t.datetime :UltimoAcesso
      t.string :crypted_password
      t.string :salt
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.timestamps
    end
    add_index :pessoas, :Login, :unique => true
    add_index :pessoas, :Email, :unique => true
  end

  def self.down
    drop_table :pessoas
  end
end
