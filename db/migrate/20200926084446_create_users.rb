class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
