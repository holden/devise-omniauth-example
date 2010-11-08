class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def method_missing(provider)
    if !User.omniauth_providers.index(provider).nil?
      #omniauth = request.env["omniauth.auth"]
      auth = env["omniauth.auth"]
    
      if current_user
        current_user.user_tokens.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
         flash[:notice] = "Authentication successful"
         redirect_to edit_user_registration_path
      else
    
      authentication = UserToken.find_by_provider_and_uid(auth['provider'], auth['uid'])
   
        if authentication
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => auth['provider']
          sign_in_and_redirect(:user, authentication.user)
          #sign_in_and_redirect @user, :event => :authentication
          #render :text => env["omniauth.auth"].to_yaml
        else
          #session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    end
  end
  
end