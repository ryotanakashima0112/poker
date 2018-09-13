class CreateGamePokers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_pokers do |t|
      t.string :hand

      t.timestamps
    end
  end
end
