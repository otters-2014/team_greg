class AddsMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :subject
      t.text :body
      t.integer :parent_id

      t.timestamps
    end
  end
end
