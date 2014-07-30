module QuestsHelper

#need another method in here to check step num, this is rudimentary
#also need to a quest status to filter out quests that arent valid yet, invalid now, etc..
	def user_checkpoint_check(user, checkin)
		#i want the following line to have .where(location_id: location.id) and only load those, however
		#at this time i am not sure it will work because multiple locations may be created. going to fix that.
		user.checkpoints.each do |checkpoint|
			if checkpoint.location.foursquare_id == checkin.foursquare_id
				checkpoint.user_checkpoints.find_by(user_id: user.id).complete!
				user_quest_check(user, checkpoint)
				Notification.create(user_id: user.id, title: "Check Point Completed!", content: "You've completed a checkpoint for #{checkpoint.quest.title.titleize} Keep up the good work!")
			end
		end
	end

	def user_quest_check(user, checkpoint)
		quest = Quest.find(checkpoint.quest_id)
		if quest.user_checkpoints.where(user_id: user.id).all?{|record| record.completed == true}
			quest.user_quests.find_by(user_id: user.id).complete!
			Notification.create(user_id: user.id, title: "QUEST COMPLETE!", content: "You've Completed #{quest.title.titleize} As a reward you get #{quest.xp} XP.")
		end
	end

	def quest_info
		[@quest.title, @quest.xp, @quest.userstatus, @quest.timestatus, @quest.end_date, @quest.category, @quest.description]
	end


end
