class Route < ActiveRecord::Base
	has_many :waypoints

	has_many :histories
  	has_many :users, through: :histories

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

		current_user.save
	end


	def self.addHistory(route, current_user)

		@history = History.new
		@history.user_id = current_user.id
		@history.route_id = route.id
		@history.date = Date.current

		@history.save

	end
end
