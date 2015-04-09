object @event

node :status do |event|
	response.status
end

node :message do 
	'There was a conflict while creating this tag, try another name please'
end