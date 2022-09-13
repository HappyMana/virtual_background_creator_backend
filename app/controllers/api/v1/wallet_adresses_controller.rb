class Api::V1::WalletAdressesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def upload
    @wallet_address = current_api_v1_user.wallet_addresses.build(wallet_address_params)

    if @wallet_address.save
      render json: { status: 'SUCCESS', message: 'registered wallet address', data: @wallet_address }
    else
      render json: { status: 'SUCCESS', message: 'An error occurred during wallet address registration', data: @wallet_address.errors }
    end
  end

  private

    def wallet_address_params
      params.permit(:wallet_address)
    end
end
