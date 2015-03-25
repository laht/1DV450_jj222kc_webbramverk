class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
		t.string 'name', :null => false, :unique => true
		t.timestamps
    end
    create_table :events_tags, :id => false do |t|
      t.references :event, :tag, index: true
    end
  end
end