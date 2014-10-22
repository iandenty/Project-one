# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Player.destroy_all
Game.destroy_all

p1 = Player.create name: "Tobias"
p2 = Player.create name: "Gerry"
p3 = Player.create name: "Mathilda"
p4 = Player.create name: "Dave"

Game.create player1_id: p1.id, player2_id: p2.id
Game.create player1_id: p1.id, player2_id: p3.id
Game.create player1_id: p4.id, player2_id: p3.id
Game.create player1_id: p3.id, player2_id: p2.id
Game.create player1_id: p2.id, player2_id: p1.id