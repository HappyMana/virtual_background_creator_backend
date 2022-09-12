class Api::V1::PicturesController < ApplicationController
  def index
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: "this is pircture controller index" }
  end

  def upload

  end
end
