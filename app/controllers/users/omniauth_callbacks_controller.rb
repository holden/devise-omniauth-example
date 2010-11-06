class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  #  # You need to implement the method below in your model
  #  @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
  #  @user = User.find(1)
  #  #
  #  if @user.persisted?
  #    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
  #    sign_in_and_redirect @user, :event => :authentication
  #  else
  #    session["devise.facebook_data"] = env["omniauth.auth"]
  #    redirect_to new_user_registration_url
  #  end
    do_everything_in_one_callback_instead_of_ten
  end
  
  def twitter
    do_everything_in_one_callback_instead_of_ten
  end
  
  def google_apps
    do_everything_in_one_callback_instead_of_ten
  end
  
  def do_everything_in_one_callback_instead_of_ten
    omniauth = request.env["omniauth.auth"]
    
    if current_user #if the user has an account and wants to add more authentications
      auth = env["omniauth.auth"]
      current_user.user_tokens.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
       flash[:notice] = "Authentication successful"
       redirect_to edit_user_registration_path
    else
    #find and logged them in
    authentication = UserToken.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
   
      if authentication
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
        sign_in_and_redirect(:user, authentication.user)
        #sign_in_and_redirect @user, :event => :authentication
        #render :text => env["omniauth.auth"].to_yaml
      else
        #no account exists
        session["devise.facebook_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
  
end