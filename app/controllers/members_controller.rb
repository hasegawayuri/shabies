class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    session[:group_member] ||= params[:group_id]
    @members = Member.where(group_id: session[:group_member])
    @group = Group.find(session[:group_member])
  end

  # GET /members/1 or /members/1.json
  def show
    session[:user_link] ||= params[:user_id]
    @member_s = Member.where(user_id: session[:user_link])
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
     
    respond_to do |format|
      if @member.save
        format.html { redirect_to groups_url, notice: "参加しました" }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to groups_url(@member) }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy

    @member.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "脱退しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:user_id, :group_id)
    end
end
