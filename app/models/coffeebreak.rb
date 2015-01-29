class Coffeebreak < ActiveRecord::Base
  def self.on_break?
    Coffeebreak.all.any?
  end
end
