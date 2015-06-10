class History < ActiveRecord::Base
	belongs_to :user
  	belongs_to :route

  	def self.averageDifficulty(user)
  		arrayAverage = []
		arrayAverage << beginner = user.routes.where("difficulty like 'Principiantes'").count
		arrayAverage << medium = user.routes.where("difficulty like 'Intermedia'").count
		arrayAverage << master = user.routes.where("difficulty like 'Dificil'").count
		
			case arrayAverage.max
			when beginner
			  return "Begginer"
			when medium
			  return "Medium"
			when master
			  return "Master"
			end
  	end

  	def self.totalRoutesCompleted(user)
  		return total = user.routes.count
  	end
end
