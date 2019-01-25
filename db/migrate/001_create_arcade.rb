class CreateArcade < ActiveRecord::Migration[4.2]
  def change
    create_table :arcades do |t|
      t.string :game_name
      t.integer :price, default: 2
    end
  end
end
