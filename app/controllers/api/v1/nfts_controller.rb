class Api::V1::NftsController < ApplicationController
  def index
    # API接続確認のため、仮の画像データを返す
    render json:
      {
        status: 'SUCCESS',
        message: 'Loaded posts',
        data: [
          "https://fantop.jp/images/items/188-10/1/contents/0/thumbnail_mentori_mini_10.jpg",
          "https://fantop.jp/images/items/155-01/1/contents/0/item_thumbnail_zorori.jpg"
        ]
      }
  end
end
