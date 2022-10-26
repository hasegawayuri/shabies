class GpinsController < ApplicationController
  before_action :set_gpin, only: %i[ show edit update destroy ]

  # GET /gpins or /gpins.json
  def index
    @gpins = Gpin.all
  end

  # GET /gpins/1 or /gpins/1.json
  def show
  end

  # GET /gpins/new
  def new
    @gpin = Gpin.new
  end

  # GET /gpins/1/edit
  def edit
  end

  # POST /gpins or /gpins.json
  def create
    @gpin = Gpin.new(gpin_params)

    respond_to do |format|
      if @gpin.save
        format.html { redirect_to gpin_url(@gpin), notice: "Gpin was successfully created." }
        format.json { render :show, status: :created, location: @gpin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gpin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpins/1 or /gpins/1.json
  def update
    respond_to do |format|
      if @gpin.update(gpin_params)
        format.html { redirect_to gpin_url(@gpin), notice: "Gpin was successfully updated." }
        format.json { render :show, status: :ok, location: @gpin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gpin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpins/1 or /gpins/1.json
  def destroy
    @gpin.destroy

    respond_to do |format|
      format.html { redirect_to gpins_url, notice: "Gpin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpin
      @gpin = Gpin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gpin_params
      params.require(:gpin).permit(:user_id, :group_id)
    end
end
