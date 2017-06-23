class RemoveColumnPlayersFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :first_player, :integer
    remove_column :games, :second_player, :integer
    remove_column :games, :third_player, :integer
    remove_column :games, :fourth_player, :integer
  end
end
