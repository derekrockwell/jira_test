#class utilized to monkeypatch the devise 'failed login'
#to redirect to the root page instead of /users/sign_in

class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
