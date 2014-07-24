# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business = User.new
business.name = "DBC"
business.email = "dishes@dbc.com"
business.password = "testtest"
business.password_confirmation = "testtest"
business.save!

bar = Location.new
bar.name = "Awesome Bar"
bar.type = "Bar"
bar.latitude = 40.7903
bar.longitude = 73.9597
bar.save!
#should locations belong to a user? perhaps through quests and checkpoints

player = User.new
player.name = "Greg"
player.email = "greg@dbc.com"
player.password = "testtest"
player.password_confirmation = "testtest"
player.save!

quest = Quest.new
quest.title = "Come Get A Beer!" # Quest neests a title
quest.creator_id = business.id
quest.type = "bar"
quest.end_date = Time.now + 1.day
quest.save!

beer = Reward.new
beer.quest_id = quest.id
beer.xp = 500

checkpoint = Checkpoint.new
checkpoint.instructions = "Recieve beer" # checkpoints need an instruction
checkpoint.quest_id = quest.id
checkpoint.location_id = bar.id
checkpoint.step_num = 1

greg_gets_a_beer = UserQuest.new
greg_gets_a_beer.quest_id = quest.id
greg_gets_a_beer.user_id = player.id

# user_checkpoints should be automattically created using a before_create method on user_quests





