OmniAuth.config.test_mode = true
def set_omniauth
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: "facebook",
    uid: "123545",
    info: { email: "example@email.com",
                name: "Name" }
  )
end

def set_invalid_omniauth
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end
