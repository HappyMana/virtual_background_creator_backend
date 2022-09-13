class Api::V1::PicturesController < ApplicationController
  before_action :authenticate_api_v1_user!
  def index
    # ローカル画像を取得
    local_pictures = getLocalPictures

    # ローカル画像がない場合
    return render json: { status: 'SUCCESS', message: 'local pictures not found', data: [] } if local_pictures.blank?

    render json: { status: 'SUCCESS', message: 'get local pictures', data: local_pictures }
  end

  def upload

  end

  private

    # ローカル画像をDBから取得
    def getLocalPictures
      pictures = Picture.where(user_id: current_api_v1_user.id).pluck(:binary_data)
    end
end
