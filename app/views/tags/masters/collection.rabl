object false

node :self do |tag|
	url_for(:only_path => false, :overwrite_params=>nil)
end

node :items do |tag|
	partial '/tags/masters/instance', object: @tags, locals: { :link_label => 'href' }
end