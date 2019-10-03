class Users::PasswordsController < Devise::PasswordsController; 
   def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      set_flash_message! :notice, notice
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      flash[:error] = resource.errors.full_messages.join("<br/>").html_safe
      respond_with(resource)
    end
  end  
end
