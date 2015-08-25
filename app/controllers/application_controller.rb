class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with realm: "Helplist administration", name: "username", password: "password", if: :need_authentication?

  before_action :get_breaks_and_comments

  private
    def get_breaks_and_comments
      @break = Break.first
      @comments = Comment.for_course(params[:course]) 
    end

    def need_authentication?
      !params[:controller].in?(['entries'])
    end

    # get admin status
    def admin?
      params[:admin]
    end
end
