class AddTimestampsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timestamps, :string
  end
end
