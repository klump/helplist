class CreateBreaks < ActiveRecord::Migration
  def change
    create_table :breaks do |t|
      t.boolean :coffee
      t.string :comment

      t.timestamps null: false
    end
  end
end
