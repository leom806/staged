def sign_out
  delete destroy_user_session_path
end
