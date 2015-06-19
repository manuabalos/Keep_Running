class Ladder < ActiveRecord::Base

	def self.getLeagues(numRunners, infoRunners)
		@@leagues = []

		if numRunners == 1
			imgLeagues(infoRunners)
		elsif numRunners == "all" 
			infoRunners.each do |runner|
				imgLeagues(runner)
			end	
		end

		return @@leagues
	end

	def self.imgLeagues(runner)
		if(runner.level >= 1 && runner.level <= 5)
			@@leagues << "7 Bronce"
		elsif (runner.level >= 6 && runner.level <= 10)
			@@leagues << "6 Plata"
		elsif (runner.level >= 11 && runner.level <= 20)
			@@leagues << "5 Oro"
		elsif (runner.level >= 21 && runner.level <= 30)
			@@leagues << "4 Platino"
		elsif (runner.level >= 31 && runner.level <= 45)
			@@leagues << "3 Diamante"
		elsif (runner.level >= 46 && runner.level <= 55)
			@@leagues << "2 Maestro"
		elsif (runner.level > 55)
			@@leagues << "1 Gran Maestro"
		end
	end

end