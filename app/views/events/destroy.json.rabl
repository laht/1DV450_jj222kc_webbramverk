object @event

node :status do |event|
	response.status
end

node :message do 
	'The resource was removed successfully'
end