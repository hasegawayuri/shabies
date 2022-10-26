class UserroomsController < ApplicationController
  before_action :set_userroom, only: %i[ show edit update destroy ]

  # GET /userrooms or /userrooms.json
  def index
    @userrooms = Userroom.all
  end

  # GET /userrooms/1 or /userrooms/1.json
  def show
  end

  # GET /userrooms/new
  def new
    @userroom = Userroom.new
  end

  # GET /userrooms/1/edit
  def edit
  end

  # POST /userrooms or /userrooms.json
  def create
    @userroom = Userroom.new(userroom_params)

    respond_to do |format|
      if @userroom.save
        format.html { redirect_to userroom_url(@userroom), notice: "Userroom was successfully created." }
        format.json { render :show, status: :created, location: @userroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userrooms/1 or /userrooms/1.json
  def update
    respond_to do |format|
      if @userroom.update(userroom_params)
        format.html { redirect_to userroom_url(@userroom), notice: "Userroom was successfully updated." }
        format.json { render :show, status: :ok, location: @userroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userrooms/1 or /userrooms/1.json
  def destroy
    @userroom.destroy

    respond_to do |format|
      format.html { redirect_to userrooms_url, notice: "Userroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userroom
      @userroom = Userroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userroom_params
      params.require(:userroom).permit(:user_id, :room_id)
    end
end
