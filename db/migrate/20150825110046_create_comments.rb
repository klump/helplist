class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :course
      t.string :message
      t.string :signature

      t.timestamps null: false
    end
  end
end
