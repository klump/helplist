class AddClosedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :closed, :timestamp
  end
end
