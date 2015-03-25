class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
    	t.string 'name', :null => false
    	t.timestamps
    end
  end
end
