class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friended_by
      t.integer :friended

      t.timestamps null: false
    end
  end
end
