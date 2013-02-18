Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for twitter
  provider :twitter, "XXXXXX", "YYYYYYYYYYYY"

  # If you want to also configure for additional login services, they would be configured here.
end