class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :conversation_id
      t.text :text

      t.timestamps
    end
  end
end
