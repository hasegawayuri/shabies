class UsersController < ApplicationController
    #以下追記
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to profile_path(@user)
      else
        render 'new'
      end
    end

    def show
     @user = User.find(params[:id])
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to signup_path
    end

    private
      def user_params
        params.require(:user).permit(:mailaddress, :password, :password_confirmation, :name)
      end
end
