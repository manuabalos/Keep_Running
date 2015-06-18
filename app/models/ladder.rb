class Ladder < ActiveRecord::Base

	def self.takeLeague(runner)
		if(runner.level >= 1 && runner.level <= 5)
			return "7 Bronce"
		elsif (runner.level >= 6 && runner.level <= 10)
			return "6 Plata"
		elsif (runner.level >= 11 && runner.level <= 20)
			return "5 Oro"
		elsif (runner.level >= 21 && runner.level <= 30)
			return "4 Platino"
		elsif (runner.level >= 31 && runner.level <= 45)
			return "3 Diamante"
		elsif (runner.level >= 46 && runner.level <= 55)
			return "2 Maestro"
		elsif (runner.level > 55)
			return "1 Gran Maestro"
		end
	end

	def self.takeLeagues(runners)

		leagues = []

		runners.each do |runner|

			if(runner.level >= 1 && runner.level <= 5)
				leagues << "7 Bronce"
			elsif (runner.level >= 6 && runner.level <= 10)
				leagues << "6 Plata"
			elsif (runner.level >= 11 && runner.level <= 20)
				leagues << "5 Oro"
			elsif (runner.level >= 21 && runner.level <= 30)
				leagues << "4 Platino"
			elsif (runner.level >= 31 && runner.level <= 45)
				leagues << "3 Diamante"
			elsif (runner.level >= 46 && runner.level <= 55)
				leagues << "2 Maestro"
			elsif (runner.level > 55)
				leagues << "1 Gran Maestro"
			end

		end

		return leagues
	end

end