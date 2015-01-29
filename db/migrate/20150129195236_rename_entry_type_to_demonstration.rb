class RenameEntryTypeToDemonstration < ActiveRecord::Migration
  def change
		rename_column :entries, :type, :demonstration
  end
end
