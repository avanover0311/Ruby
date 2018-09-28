class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
