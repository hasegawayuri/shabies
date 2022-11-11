class UsersController < ApplicationController
    before_action :require_login, only: [:show, :destroy, :edit, :update]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
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
          if @user.update(user_edit_params)
            format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    

    def show
     @user = User.find(current_user.id)
    end

    def destroy
      current_user.destroy
      redirect_to signup_path
    end

    private
      def user_params
        params.require(:user).permit(:mailaddress, :password, :password_confirmation, :name)
      end
      def user_edit_params
        params.require(:user).permit(:name, :age, :hobby, :introduction)
      end
end

