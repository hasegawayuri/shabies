class BpinsController < ApplicationController
  before_action :set_bpin, only: %i[ show edit update destroy ]

  # GET /bpins or /bpins.json
  def index
    @bpins = Bpin.all
  end

  # GET /bpins/1 or /bpins/1.json
  def show
  end

  # GET /bpins/new
  def new
    @bpin = Bpin.new
  end

  # GET /bpins/1/edit
  def edit
  end

  # POST /bpins or /bpins.json
  def create
    @bpin = Bpin.new(bpin_params)

    respond_to do |format|
      if @bpin.save
        format.html { redirect_to bpin_url(@bpin), notice: "Bpin was successfully created." }
        format.json { render :show, status: :created, location: @bpin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bpin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bpins/1 or /bpins/1.json
  def update
    respond_to do |format|
      if @bpin.update(bpin_params)
        format.html { redirect_to bpin_url(@bpin), notice: "Bpin was successfully updated." }
        format.json { render :show, status: :ok, location: @bpin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bpin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bpins/1 or /bpins/1.json
  def destroy
    @bpin.destroy

    respond_to do |format|
      format.html { redirect_to bpins_url, notice: "Bpin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bpin
      @bpin = Bpin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bpin_params
      params.require(:bpin).permit(:user_id, :board_id)
    end
end
