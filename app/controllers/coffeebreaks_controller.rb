class CoffeebreaksController < ApplicationController
  def start
	Coffeebreak.new.save

	redirect_to root_url, notice: 'Coffeebreak was successfully started.'
  end

  def end
	Coffeebreak.delete_all

	redirect_to root_url, notice: 'Coffeebreak was successfully ended.'
  end
end
