object false

node :self do |creator|
	url_for(:only_path => false, :overwrite_params=>nil)
end

node :items do |creator|
	partial '/creators/masters/instance', object: @creators, locals: { :link_label => 'href' }
end