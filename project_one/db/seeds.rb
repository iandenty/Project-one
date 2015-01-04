# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.destroy_all


p1 = Player.create(name: "Computer", password: "a", password_confirmation: "a", remote_player_image_url: "http://www.bnsk.de/wp-content/uploads/2007/08/corey-feldman.jpg")




p2 = Player.create(name: "Tobias", password: "a", password_confirmation: "a")
p3 = Player.create(name: "Gerry", password: "a", password_confirmation: "a")
p4 = Player.create(name: "Mathilda", password: "a", password_confirmation: "a")
p5 = Player.create(name: "Dave", password: "a", password_confirmation: "a")


Game.create player1_id: p1.id, player2_id: p3.id
Game.create player1_id: p4.id, player2_id: p3.id
Game.create player1_id: p3.id, player2_id: p2.id
Game.create player1_id: p2.id, player2_id: p1.id
Game.create player1_id: p2.id, player2_id: p1.id
Game.create player1_id: p2.id, player2_id: p1.id
Game.create player1_id: p2.id, player2_id: p1.id
Game.create player1_id: p2.id, player2_id: p1.id