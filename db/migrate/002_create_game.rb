class CreateGame < ActiveRecord::Migration[4.2]

  def change
    create_table :games do |t|
      t.string :game_name
      t.string :username
      t.integer :price, default: 2
    end
  end

end
