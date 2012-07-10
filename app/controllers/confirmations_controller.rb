class ConfirmationsController < Devise::ConfirmationsController
	protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      receber_email_confirmation_path
    end
end