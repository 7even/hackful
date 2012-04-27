class ServicesController <  Devise::OmniauthCallbacksController
  def index

  end

  def twitter
    omniauth = request.env['omniauth.auth']

    render :text => 'Error: Omniauth is empty' and return unless omniauth
    name = omniauth['extra']['access_token'].params[:screen_name] ? omniauth['extra']['access_token'].params[:screen_name] : ''
    uid = omniauth['extra']['access_token'].params[:user_id] ? omniauth['extra']['access_token'].params[:user_id] : ''
    provider = omniauth['provider'] ? omniauth['provider'] : ''

    # continue only if provider and uid exist
    if uid == '' or provider == ''
      flash[:error] = 'Error while authenticating '
      redirect_to new_user_session_path
    end

    if user_signed_in?
      # check if this service is already linked to his/her account, if not, add it
      auth = Service.find_by_provider_and_uid(provider, uid)
      if !auth
        current_user.services.create(:provider => provider, :uid => uid, :uname => name)
        flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account.'
        redirect_to root_path
      else
        flash[:notice] = service_route.capitalize + ' is already linked to your account.'
        redirect_to root_path
      end
    end

    auth = Service.find_by_provider_and_uid(provider, uid)
    if auth
      # already has everything to login
      flash[:notice] = 'Signed in successfully via ' + provider.capitalize + '.'
      sign_in_and_redirect(:user, auth.user)
    else
      unless name == ''
        existinguser = User.find_by_name(name)
        # we have such user in database
        if existinguser
          existinguser.services.create(:provider => provider, :uid => uid, :uname => name)
          flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account ' + existinguser.email + '. Signed in successfully!'
          sign_in_and_redirect(:user, existinguser)
        # no such user yet
        else
          # let's create a new user: register this user and add this authentication method for this user
          name = name[0, 39] if name.length > 39             # otherwise our user validation will hit us
          # new user, set email, a random password and take the name from the authentication service
          # twitter users does not have email, so we set it here to some value
          user = User.new(:password => SecureRandom.hex(10), :name => name, :email => "#{name}@example.com")

          # add this authentication service to our new user
          user.services.build(:provider => provider, :uid => uid, :uname => name)

          # do not send confirmation email, we directly save and confirm the new record
          user.save!

          # flash and sign in
          flash[:myinfo] = 'Your account has been created via ' + provider.capitalize + '. In your profile you can change your personal information and add a local password.'
          sign_in
          redirect_to root_path
        end
      end
    end
  end

  def facebook
    omniauth = request.env['omniauth.auth']

    render :text => 'Error: Omniauth is empty' and return unless omniauth

    email = omniauth['info']['email'] ? omniauth['info']['email'] : ''
    name = omniauth['info']['last_name'] ? omniauth['info']['last_name'] : ''
    uid = omniauth['uid'] ? omniauth['uid'] : ''
    provider = omniauth['provider'] ? omniauth['provider'] : ''

    render :text => email + "--" + name + "--" + uid and return

    # continue only if provider and uid exist
    if uid == '' or provider == ''
      flash[:error] = 'Error while authenticating '
      redirect_to new_user_session_path
    end

    if user_signed_in?
      # check if this service is already linked to his/her account, if not, add it
      auth = Service.find_by_provider_and_uid(provider, uid)
      if !auth
        current_user.services.create(:provider => provider, :uid => uid, :uname => name, :uemail => email)
        flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account.'
        redirect_to root_path
      else
        flash[:notice] = service_route.capitalize + ' is already linked to your account.'
        redirect_to root_path
      end
    end

    auth = Service.find_by_provider_and_uid(provider, uid)
    if auth
      # already has everything to login
      flash[:notice] = 'Signed in successfully via ' + provider.capitalize + '.'
      sign_in_and_redirect(:user, auth.user)
    else
      unless email == ''
        existinguser = User.find_by_email(email)
        # we have such user in database
        if existinguser
          existinguser.services.create(:provider => provider, :uid => uid, :uname => name, :uemail => email)
          flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account ' + existinguser.email + '. Signed in successfully!'
          sign_in_and_redirect(:user, existinguser)
        # no such user yet
        else
          # let's create a new user: register this user and add this authentication method for this user
          name = name[0, 39] if name.length > 39             # otherwise our user validation will hit us
          # new user, set email, a random password and take the name from the authentication service
          # twitter users does not have email, so we set it here to some value
          user = User.new(:password => SecureRandom.hex(10), :name => name, :email => email)

          # add this authentication service to our new user
          user.services.build(:provider => provider, :uid => uid, :uname => name, :uemail => email)

          # do not send confirmation email, we directly save and confirm the new record
          user.save!

          # flash and sign in
          flash[:myinfo] = 'Your account has been created via ' + provider.capitalize + '. In your profile you can change your personal information and add a local password.'
          sign_in
          redirect_to root_path
        end
      end
    end
  end

  def destroy

  end
end