class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :game_id
      t.boolean :player1_win
      t.boolean :player2_win
      t.boolean :draw

      t.timestamps
    end
  end
end
