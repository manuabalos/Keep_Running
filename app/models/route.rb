class Route < ActiveRecord::Base
	has_many :waypoints

	def self.addExperience(route, current_user)
		case route.difficulty
			when "Principiantes"
			    current_user.experience = current_user.experience + 10
			when "Intermedia"
			  	current_user.experience = current_user.experience + 50
			when "Dificil"
				current_user.experience = current_user.experience + 100
		end

		if current_user.experience >= 1000
			expAdd = current_user.experience - 1000
			current_user.experience = 0 + expAdd
			current_user.level += 1
		end
	end
end
