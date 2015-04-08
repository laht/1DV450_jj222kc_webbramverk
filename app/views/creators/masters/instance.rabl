object @creator

node (locals[:link_lable] || :self) do |creator|
	creator_url(creator)
end

node :data do |creator|
	partial '/creators/masters/creator_data', object: creator
end