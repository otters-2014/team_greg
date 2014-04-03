class CreateKbombs < ActiveRecord::Migration
  def change
    create_table :kbombs do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
