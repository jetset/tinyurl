Rails.application.routes.draw do
  namespace :v1 do
    resources :posts , only: [:create, :show]
  end
  get '/:id' => 'v1/posts#show', as: :home_id
end
