# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business = User.new
business.firstname = "DBC"
business.email = "dishes@dbc.com"
business.foursquare_id = 1
business.save!

player = User.new
player.firstname = "Greg"
player.email = "greg@dbc.com"
player.gender = "male"
player.foursquare_id = 2
player.save!

bar = Location.new
bar.name = "Awesome Bar"
bar.venue_type = "Bar"
bar.latitude = 40.7903
bar.longitude = -73.9597
bar.address = "48 Wall St, New York, NY 10005"
bar.save!

checkin_loc = Location.new
checkin_loc.name = "CheckIn0"
checkin_loc.venue_type = "checkin_loc0"
checkin_loc.latitude = 40.7703
checkin_loc.longitude = -73.9997
checkin_loc.street = "160 34th St"
checkin_loc.city = "New York"
checkin_loc.state = "NY"
checkin_loc.country = "US"
checkin_loc.zip = "10016"
checkin_loc.foursquare_id = "kjf3jfosefjw"
checkin_loc.save!

quest = Quest.new
quest.title = "Come Get A Beer!"
quest.creator_id = business.id
quest.category = "bar"
quest.description = "The search for beer commences"
quest.xp = 500
quest.end_date = Time.now + 1.day
quest.save!

checkpoint = Checkpoint.new
checkpoint.instructions = "Receive beer"
checkpoint.quest_id = quest.id
checkpoint.location_id = checkin_loc.id
checkpoint.step_num = 1
checkpoint.save!

beer = Reward.new
beer.quest_id = quest.id
beer.description = "Yay! Beer!"
beer.save!

greg_gets_a_beer = UserQuest.new
greg_gets_a_beer.quest_id = quest.id
greg_gets_a_beer.user_id = player.id
greg_gets_a_beer.complete!

greg_gets_a_reward = UserReward.new
greg_gets_a_reward.reward_id = beer.id
greg_gets_a_reward.user_id = player.id
greg_gets_a_reward.save!
greg_gets_a_beer.save!

gregs_checkin = CheckIn.new
gregs_checkin.location_id = checkin_loc.id
gregs_checkin.user_id = player.id
gregs_checkin.save!


gregs_checkpoint = UserCheckpoint.new
gregs_checkpoint.user_id = player.id
gregs_checkpoint.checkpoint_id = checkpoint.id
gregs_checkpoint.complete!
gregs_checkpoint.save!


