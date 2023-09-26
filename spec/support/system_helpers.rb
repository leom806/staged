def sign_in(user)
  login_as user
end

def sign_out
  delete destroy_user_session_path
end
