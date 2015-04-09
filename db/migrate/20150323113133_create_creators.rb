class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
    	t.string 'name', :null => false
    	t.string 'email', :null => false, :unique => true
    	t.timestamps
    end
  end
end
