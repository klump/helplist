namespace :entries do
  desc "Clears all entries"
  task clear: :environment do
    Entry.delete_all
  end
end
