# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.destroy_all
Game.destroy_all

p1 = Player.create name: "Tobias", password: "a", password_confirmation: "a"
p2 = Player.create name: "Gerry", password: "a", password_confirmation: "a"
p3 = Player.create name: "Mathilda", password: "a", password_confirmation: "a"
p4 = Player.create name: "Dave", password: "a", password_confirmation: "a"

# g1 = Game.create player1_id: p1.id, player2_id: p2.id
# m1 = g1.moves.create(player_move: 4)

Game.create player1_id: p1.id, player2_id: p3.id
Game.create player1_id: p4.id, player2_id: p3.id
Game.create player1_id: p3.id, player2_id: p2.id
Game.create player1_id: p2.id, player2_id: p1.id