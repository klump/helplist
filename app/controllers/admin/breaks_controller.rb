class Admin::BreaksController < ApplicationController
  # POST /admin/break
  # POST /admin/break.json
  def create
    @break = Break.new(break_params)

    respond_to do |format|
      if @break.save
        format.html { redirect_to admin_url, notice: 'Break started.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/break
  # DELETE /admin/break.json
  def destroy
    Break.destroy_all
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'Break ended.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def break_params
      params.require(:break).permit(:comment, :coffee)
    end
end
