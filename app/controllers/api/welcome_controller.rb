class Api::WelcomeController < Api::BaseController

  def index
    render json: {message: @your_var}
  end
end
