class SignsController < ApplicationController
  def index
    signs = Signs.all?
    render json: signs # I'm assuming we're aiming to render as json
  end
end