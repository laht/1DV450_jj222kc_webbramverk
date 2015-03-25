class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
    	t.string 'name', :null => false
    	t.integer 'longitude', :null => false
    	t.integer 'latitude', :null => false
    	t.timestamps
    end
  end
end
