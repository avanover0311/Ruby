class AddNinjaToDojos < ActiveRecord::Migration
  def change
    add_reference :dojos, :ninja, index: true, foreign_key: true
  end
end
