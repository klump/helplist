class BreaksController < ApplicationController
  before_action :set_break, only: [:show, :edit, :update, :destroy]

  # GET /breaks
  # GET /breaks.json
  def index
    @breaks = Break.all
  end

  # GET /breaks/1
  # GET /breaks/1.json
  def show
  end

  # GET /breaks/new
  def new
    @break = Break.new
  end

  # GET /breaks/1/edit
  def edit
  end

  # POST /breaks
  # POST /breaks.json
  def create
    @break = Break.new(break_params)

    respond_to do |format|
      if @break.save
        format.html { redirect_to @break, notice: 'Break was successfully created.' }
        format.json { render :show, status: :created, location: @break }
      else
        format.html { render :new }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breaks/1
  # PATCH/PUT /breaks/1.json
  def update
    respond_to do |format|
      if @break.update(break_params)
        format.html { redirect_to @break, notice: 'Break was successfully updated.' }
        format.json { render :show, status: :ok, location: @break }
      else
        format.html { render :edit }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breaks/1
  # DELETE /breaks/1.json
  def destroy
    @break.destroy
    respond_to do |format|
      format.html { redirect_to breaks_url, notice: 'Break was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_break
      @break = Break.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def break_params
      params.require(:break).permit(:course, :message)
    end
end
