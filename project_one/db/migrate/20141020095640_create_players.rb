class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.text :image
      t.string :password_digest

      t.timestamps
    end
  end
end
