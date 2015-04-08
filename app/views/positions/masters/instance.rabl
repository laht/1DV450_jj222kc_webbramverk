object @position
collection @nearbyEvents

node (locals[:link_lable] || :self) do |position|
	position_url(position)
end

node :data do |position|
	partial '/positions/masters/position_data', object: position
end

if @nearbyEvents != nil
	child @nearbyEvents => :nearby_events do
		extends '/positions/masters/nearby_events'
	end
end
