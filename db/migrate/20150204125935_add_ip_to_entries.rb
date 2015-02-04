class AddIpToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :ip, :string
  end
end
