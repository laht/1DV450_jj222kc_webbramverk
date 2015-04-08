object false

node :self do |position|
	url_for(:only_path => false, :overwrite_params=>nil)
end

node :items do |position|
	partial '/positions/masters/instance', object: @positions, locals: { :link_label => 'href' }
end