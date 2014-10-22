class AddPlayerImageToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :player_image, :text
  end
end
