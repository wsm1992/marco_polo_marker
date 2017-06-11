class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
      t.integer :score, null: false
      t.boolean :is_last_traveller, null: false

      t.timestamps null: false
    end
    add_foreign_key :players, :users, name: :fk_Player_UserId
    add_foreign_key :players, :roles, name: :fk_Player_RoleId
  end
end
