class UsersKbombs < ActiveRecord::Migration
  def change
    create_table :users_kbombs do |t|
      t.integer :user_id
      t.integer :kbomb_id
      t.text :note

      t.timestamps
    end
  end
end
