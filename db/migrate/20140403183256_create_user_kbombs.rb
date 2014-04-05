class CreateUserKbombs < ActiveRecord::Migration
  def change
    create_table :user_kbombs do |t|
      t.integer :user_id
      t.integer :kbomb_id
      t.text :note

      t.timestamps
    end
  end
end
