Rails.application.routes.draw do
  root :to => 'pages#index'

  get 'tag'               => 'pages#tag'
  get 'format'            => 'pages#format'

  post 'remove_daily/:id' => 'today#remove_daily', :as => :remove_daily
  post 'sort_dailies' => 'today#sort_dailies'

  [:entries, :posts, :to_dos].each do |x|
    resources x
  end
end
