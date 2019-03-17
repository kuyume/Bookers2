class ApplicationController < ActionController::Base
  
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
    end
    def after_sign_in_path_for(resource)
      user_path(id: current_user.id)
    end
    def after_sign_out_path_for(resource)
      root_path 
    end
    Refile.secret_key = '4ec35d34b687c704034c0550dbf046cf761c6719fb1003b8651129630191f6a6b4b1b7c4753c41a663e8b19326b2ac8567f6f3a0527d97a7c016ed10001aa6d2'
end
