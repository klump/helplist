class AdminsController < ApplicationController
  def show
    @all_comments = Comment.all
  end
end
