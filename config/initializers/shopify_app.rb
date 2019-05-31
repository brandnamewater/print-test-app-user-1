ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "4dda779b152f2cd05f75b5f7153bdb5e"
  config.secret = "<secret>"
  config.scope = "read_orders, read_products, write_orders, read_orders"
  config.embedded_app = false
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'orders/create', address: 'https://stark-retreat-95660.herokuapp.com/webhooks/orders_create', format: 'json'},
    {topic: 'orders/update', address: 'https://stark-retreat-95660.herokuapp.com/webhooks/orders_update', format: 'json'},
  ]
end
