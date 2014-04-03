class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :cohort_id
      t.text :description

      t.timestamps
    end
  end
end
