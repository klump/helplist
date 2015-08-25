class CreateBreaks < ActiveRecord::Migration
  def change
    create_table :breaks do |t|
      t.string :course
      t.string :message

      t.timestamps null: false
    end
  end
end
