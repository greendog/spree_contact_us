Spree::Core::Engine.routes.prepend do
  resources :inquiries

  namespace :admin do
    resources :inquiries
    resource :inquiry_settings
  end

  match '/contact' => 'inquiries#new', :as => :contact
end
