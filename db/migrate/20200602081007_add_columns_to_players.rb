class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :is_first_picker, :boolean, default: false
    add_column :players, :first_shield, :integer, default: false
  end
end
