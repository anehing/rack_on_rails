MyApplication.router.config do
  get "/test", :to => "custome#index"
  get /.*/, :to => "custome#show"
end
