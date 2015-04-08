object @creator

attributes :id, :name

node :self do |creator|
	creator_url(creator)
end

