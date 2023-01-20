class UsersController < ApplicationController
    before_action :require_login, only: [:show, :destroy, :edit, :update]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      image_path = Rails.root.join("public/images/", "rails.png")
      File.open(image_path, "r+b") do |f|
        @user.icon = f.read
      end

      if @user.save
        log_in(@user)
        redirect_to profile_path
      else
        render 'new'
      end
    end
      def edit
        @user = User.find(current_user.id)
      end
      def update
        @user = User.find(current_user.id)
        respond_to do |format|
          if @user.update(user_attributes)
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    

    def show
      @user = User.find(current_user.id)
      session[:user_link] = nil
      @groups=Group.joins(:members).where(members:{user_id:current_user.id})

      group_ids = []
      @groups.each do |group|
        group_ids.push(group.id)
      end
      @members = Member.where(group_id: group_ids).select(:user_id).distinct
    end

    def destroy
      current_user.destroy
      redirect_to signup_path
    end

    def get_image
      user = User.find(params[:id])
      send_data(user.icon,disposition: :inline)
    end

    private
      def user_params
        params.require(:user).permit(:mailaddress, :password, :password_confirmation, :name)
      end
      def user_edit_params
        params.require(:user).permit(:name, :age, :hobby, :introduction, :icon)
      end
      def user_attributes
        if user_edit_params[:icon].blank?
          {
            name: user_edit_params[:name], age: user_edit_params[:age], hobby: user_edit_params[:hobby], introduction: user_edit_params[:introduction]
          }
        else
          {
            icon: user_edit_params[:icon].read, name: user_edit_params[:name], age: user_edit_params[:age], hobby: user_edit_params[:hobby], introduction: user_edit_params[:introduction]
          }
        end
      end
  
end

