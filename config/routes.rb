Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'pictures', to: 'pictures#index'
      post 'pictures', to: 'pictures#upload'

      get 'nfts', to: 'nfts#index'

      post 'wallet-adress', to: 'wallet_adresses#upload'
    end
  end
end
