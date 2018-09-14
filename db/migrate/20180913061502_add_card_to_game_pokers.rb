class AddCardToGamePokers < ActiveRecord::Migration[5.0]
  def change
    add_column :game_pokers, :card, :string
    add_column :game_pokers, :best, :boolean, default: false
  end
end
