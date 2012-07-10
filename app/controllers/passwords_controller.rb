class PasswordsController < Devise::PasswordsController
	protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      receber_email_password_path
    end
end