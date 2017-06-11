class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :first_player_id
      t.integer :second_player_id
      t.integer :third_player_id
      t.integer :fourth_player_id

      t.timestamps null: false
    end
    add_foreign_key :games, :players, column: :first_player_id, name: :fk_Game_FirstPlayerId
    add_foreign_key :games, :players, column: :second_player_id, name: :fk_Game_SecondPlayerId
    add_foreign_key :games, :players, column: :third_player_id, name: :fk_Game_ThirdPlayerId
    add_foreign_key :games, :players, column: :fourth_player_id, name: :fk_Game_FourthPlayerId
  end
end
