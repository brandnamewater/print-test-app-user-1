ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "7ca9b191100a7c7618a370e86f31e4ff"
  config.secret = "b5480c0f81a243c526bdb755015beb54"
  config.scope = "read_orders, write_orders, write_products, read_products, write_fulfillments, read_fulfillments"
  config.embedded_app = false
  config.after_authenticate_job = false
  config.session_repository = Shop

  # config.root_url = '/'

  config.webhooks = [
    {topic: 'orders/create', address: 'https://polar-shelf-74894.herokuapp.com/webhooks/orders_create', format: 'json'},
    {topic: 'orders/update', address: 'https://polar-shelf-74894.herokuapp.com/webhooks/orders_update', format: 'json'},
  ]

end
