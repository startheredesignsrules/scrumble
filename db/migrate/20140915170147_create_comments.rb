class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :status_update_id
      t.integer :user_id
      t.text :note

      t.timestamps
    end
  end
end
