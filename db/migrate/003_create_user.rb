class CreateUser < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name, default: "Guest"
      t.string :username
      t.string :pin, default: "Non"
      t.integer :age, default: 1
      t.integer :money, default: 20
    end
  end
end
