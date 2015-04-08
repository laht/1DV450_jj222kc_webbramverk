object @tag

node (locals[:link_lable] || :self) do |tag|
	tag_url(tag)
end

node :data do |tag|
	partial '/tags/masters/tag_data', object: tag
end