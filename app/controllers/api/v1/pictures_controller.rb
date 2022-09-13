class Api::V1::PicturesController < ApplicationController
  before_action :authenticate_api_v1_user!
  def index
    # ローカル画像を取得
    local_pictures = get_local_pictures

    # ローカル画像がない場合
    return render json: { status: 'SUCCESS', message: 'local pictures not found', data: [] } if local_pictures.blank?

    render json: { status: 'SUCCESS', message: 'get local pictures', data: local_pictures }
  end

  def upload
    # 送られた画像があるか
    if params[:binary_data].present?

      # 送られたすべての画像を保存する
      Picture.transaction do
        params[:binary_data].each do |binary_data|
          pictures = Picture.new(pictures_params)
          pictures.binary_data = binary_data
          pictures.save!
        end
      end
      render json: { status: 'SUCCESS', message: 'post local pictures', data: [] }
    end
  rescue
    return render json: { status: 'SUCCESS', message: 'could not post local pictures', data: [] }
  end

  private

    # ローカル画像をDBから取得
    def get_local_pictures
      pictures = Picture.where(user_id: current_api_v1_user.id).pluck(:binary_data)
    end

    def pictures_params
      params.require(:picture).permit(:binary_data).merge(user_id: user_id: current_api_v1_user.id)
    end
end
