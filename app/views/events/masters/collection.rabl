object false

node :self do |event|
	url_for(:only_path => false, :overwrite_params=>nil)
end

node :items do |event|
	partial '/events/masters/instance', object: @events, locals: { :link_label => 'href' }
end