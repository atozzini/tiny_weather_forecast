Geocoder.configure(
  timeout: 10,
  lookup: :google,
  api_key: ENV['GEOCODER_KEY']
)
