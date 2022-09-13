Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'pictures', to: 'pictures#index'
      post 'pictures', to: 'pictures#upload'

      get 'nfts', to: 'nfts#index'

      post 'wallet_address', to: 'wallet_addresses#upload'
    end
  end
end
