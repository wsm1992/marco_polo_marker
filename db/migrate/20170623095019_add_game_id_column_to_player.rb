class AddGameIdColumnToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :game_id, :integer
    Game.all.each do |g|
      g.players.each do |p|
        p.game_id = g.id
        p.save!
      end
    end
  end
end
