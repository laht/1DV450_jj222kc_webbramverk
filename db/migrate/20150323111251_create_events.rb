class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string 'name', :null => false
    	t.belongs_to :position, index: true		
		t.belongs_to :creator, index: true
    	t.timestamps
    end
  end
end
