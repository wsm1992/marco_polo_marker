class AddSeasonIdColumnToGame < ActiveRecord::Migration
  def change
    add_column :games, :season_id, :integer
    add_foreign_key :games, :seasons, name: :fk_Game_Season
  end
end
