Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for twitter
  provider :twitter, "HcerxT89oaW35Gtq7g7gw", "eslfwCUDKIV7uQ7zSfYoRbwTcRV4qCyliXbNPuw"

  # If you want to also configure for additional login services, they would be configured here.
end