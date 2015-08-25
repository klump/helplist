class Admin::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments.json
  def index
    respond_to do |format|
      format.html { raise AbstractController::ActionNotFound }
      format.json { render json: @comments.to_json, status: :ok }
    end
  end

  # GET /comments.json
  def show
    respond_to do |format|
      format.html { raise AbstractController::ActionNotFound }
      format.json { render json: @comment.to_json, status: :ok }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to admin_url }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to admin_url, alert: @comment.errors.full_messages.join(' ') }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:course, :message, :signature)
    end
end
