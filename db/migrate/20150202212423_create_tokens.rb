class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer "token", :null => false
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
