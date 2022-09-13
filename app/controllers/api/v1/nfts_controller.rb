class Api::V1::NftsController < ApplicationController
  before_action :authenticate_api_v1_user!

  require 'uri'
  require 'net/http'
  require "open-uri"

  def index
    # ウォレットアドレスを取得
    wallet_address = getWallet_address

    # ウォレットアドレスがない場合
    return render json: { status: 'SUCCESS', message: 'wallet address not found', data: [] } if wallet_address.nil?

    # ファントップのuser idを取得
    fantopUserId = getFanTopUserId(wallet_address)

    # ファントップのuser idを取得失敗した場合
    return render json: { status: 'ERROR', message: 'failed to get fantop user id', data: [] } if fantopUserId.nil?

    # NFTの画像のURLを取得
    images_url = getNftImageUrl(fantopUserId)

    # NFTの画像のURLを取得失敗した場合
    return render json: { status: 'ERROR', message: 'failed to get NFT', data: [] } if images_url.nil?

    # NFTの画像を取得
    images = getImages(images_url)

    # NFTの画像を取得失敗した場合
    return render json: { status: 'ERROR', message: 'failed to get images', data: [] } if images.nil?

    render json: { status: 'SUCCESS', message: 'get NFT', data: images }
  end

  private

    # ウォレットアドレスをDBから取得
    def getWallet_address
      wallet = current_api_v1_user.wallet_addresses.last
      if wallet.nil?
        nil
      else
        wallet.wallet_address
      end
    end

    # ファントップからウォレットアドレスを使ってファントップのuserIdを取得する
    def getFanTopUserId(wallet_address)
      url = "https://fantop.jp/api/users/addresses/#{wallet_address}"
      uri = URI.parse(url)

      begin
        response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.open_timeout = 5
          http.read_timeout = 10
          http.get(uri.request_uri)
        end

        case response
        when Net::HTTPSuccess
          hash = JSON.parse(response.body)

          hash["id"]
        else
          puts [uri.to_s, response.value].join(" : ")
          nil
        end
      rescue => e
        puts [uri.to_s, e.class, e].join(" : ")
        nil
      end
    end

    # NFT画像のURLを全て取得する
    def getNftImageUrl(fantopUserId)
      return nil if fantopUserId.nil?

      url = "https://fantop.jp/api/tokens?limit=24&offset=0&userId=#{fantopUserId}&sellingStatus=true"
      uri = URI.parse(url)

      begin
        response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.open_timeout = 5
          http.read_timeout = 10
          http.get(uri.request_uri)
        end

        case response
        when Net::HTTPSuccess
          # Api通信成功
          hash = JSON.parse(response.body)
          images_url = []
          hash.each do |item|
            images_url << item["item"]["thumbnailUrl"]
          end
          images_url
        else
          # Api通信失敗
          puts [uri.to_s, response.value].join(" : ")
          nil
        end
      rescue => e
        puts [uri.to_s, e.class, e].join(" : ")
        nil
      end
    end

    # NFT画像を全て取得する
    def getImages(images_url)
      images = []
      images_url.each do |url|
        begin
          img = 'data:image/png;base64,' + Base64.strict_encode64(open(url).read)

          logger.debug img

          images << img
        rescue
          logger.error "open url or base64 encode error"
          return nil
        end
      end

      images
    end
end
