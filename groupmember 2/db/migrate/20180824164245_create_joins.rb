class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
