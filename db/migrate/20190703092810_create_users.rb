class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :fullname
      t.date :birthday
      t.integer :gender
      t.string :avatar

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
