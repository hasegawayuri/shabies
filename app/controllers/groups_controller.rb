class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_attributes)
   
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "新たに#{group_params[:groupname]}を作成しました" }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_attributes)
        format.html { redirect_to group_url(@group), notice: "#{group_params[:groupname]}の設定を更新しました" }
        format.json { render :show, status: :ok, location: @group }
     else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    groupname = @group.groupname
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "#{groupname}が削除されました" }
      format.json { head :no_content }
    end
  end

  def get_image
    group = Group.find(params[:id])
    send_data(group.icon,disposition: :inline)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:icon, :groupname, :classification_id, :limit, :user_id, :introduction)
    end

    def group_attributes
      if group_params[:icon].blank?
        {
          groupname: group_params[:groupname], classification_id: group_params[:classification_id], limit: group_params[:limit], user_id: group_params[:user_id], introduction: group_params[:introduction]
        }
      else
        {
          icon: group_params[:icon].read, groupname: group_params[:groupname], classification_id: group_params[:classification_id], limit: group_params[:limit], user_id: group_params[:user_id], introduction: group_params[:introduction]
        }
      end
    end

end
