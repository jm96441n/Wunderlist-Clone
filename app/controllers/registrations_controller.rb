class RegistrationsController < Devise::RegistrationsController
	respond_to :json

	def create
			@user = User.create(sign_up_params)
			redirect_to react_path
	end





	private

	def sign_up_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end
