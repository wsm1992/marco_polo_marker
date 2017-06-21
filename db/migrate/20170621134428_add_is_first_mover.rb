class AddIsFirstMover < ActiveRecord::Migration
  def change
    add_column :players, :is_first_mover, :boolean, default: false
  end
end
