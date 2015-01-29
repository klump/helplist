class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :course
      t.string :name
      t.string :room
      t.integer :group
      t.boolean :type

      t.timestamps null: false
    end
  end
end
