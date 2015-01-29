class CreateCoffeebreaks < ActiveRecord::Migration
  def change
    create_table :coffeebreaks do |t|

      t.timestamps null: false
    end
  end
end
