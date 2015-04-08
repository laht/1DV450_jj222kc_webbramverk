object @event

node (locals[:link_lable] || :self) do |event|
	event_url(event)
end

node :data do |event|
	partial '/events/masters/event_data', object: event
end

node :creator do |event|
	partial '/events/masters/event_creator_data', object: event.creator
end

node :tags do |event|
	partial '/events/masters/event_tag_data', object: event.tags
end

node :position do |event|
	partial '/events/masters/event_position_data', object: event.position
end