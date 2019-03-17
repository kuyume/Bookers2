  class CustomAuthenticationFailure < Devise::FailureApp 
  protected 
    def redirect_url 
      user_path(current_user) #rootに飛ばす場合
    end 
  end 
