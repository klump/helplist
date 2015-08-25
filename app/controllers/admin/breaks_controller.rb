class Admin::BreaksController < ApplicationController
  # GET /admin/break.json
  def show
    respond_to do |format|
      format.html { raise AbstractController::ActionNotFound }
      format.json { render json: Break.to_json, status: :ok }
    end
  end

  # POST /admin/break
  # POST /admin/break.json
  def create
    respond_to do |format|
      if Break.start
        format.html { redirect_to admin_url }
        format.json { render :show, status: :created, location: admin_break_url }
      else
        format.html { redirect_to admin_url, alert: @break.errors.full_messages.join(' ') }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/break
  # DELETE /admin/break.json
  def destroy
    Break.end
    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end
end
