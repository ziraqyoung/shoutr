class UsersController < Clearance::UsersController
  private

    def user_params
      params.require(:user).permit(:email, :username, :password)
    end
end
