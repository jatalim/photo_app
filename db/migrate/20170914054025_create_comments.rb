class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.references :photo, foreign_key: true
    	t.references :user, foreign_key: true
    	t.string :comments
    	t.string :username
    	t.timestamps
    end
  end
end
