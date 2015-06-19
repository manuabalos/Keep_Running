module ApplicationHelper

	def getStarsImg(user)
  		if user.experience >= 0 && user.experience < 200
			return "0"
		elsif user.experience >= 200 && user.experience < 400
			return "1"
		elsif user.experience >= 400 && user.experience < 500
			return "2"
		elsif user.experience >= 500 && user.experience < 700
			return "3"
		elsif user.experience >= 700 && user.experience < 900
			return "4"
		elsif user.experience >= 900
			return "5"
		end
  	end

end
