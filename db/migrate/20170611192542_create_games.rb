class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :first_player
      t.integer :second_player
      t.integer :third_player
      t.integer :fourth_player

      t.timestamps null: false
    end
    add_foreign_key :games, :players, column: :first_player
    add_foreign_key :games, :players, column: :second_player
    add_foreign_key :games, :players, column: :third_player
    add_foreign_key :games, :players, column: :fourth_player
  end
end
