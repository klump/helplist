class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :course
      t.string :name
      t.string :room
      t.integer :group
      t.boolean :demonstration
      t.string :ip
      t.timestamp :closed_at, default: nil

      t.timestamps null: false
    end
  end
end
