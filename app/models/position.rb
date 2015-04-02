class Position < ActiveRecord::Base
	has_many :events

	def nearbyEvents
		posOffset = 5

		lat = self.latitude
		lng = self.longitude

		for i in 1..posOffset
			p = Position.where(latitude: lng+i, longitude: lat+i)
			p.each do pos
				pos.events.each do e
					events << e
				end
			end
		end
		return events
	end

end
