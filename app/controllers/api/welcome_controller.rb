class Api::WelcomeController < Api::BaseController
  before_action :authenticate_request

  def index
    render json: {message: @your_var, user: current_user.email}
  end
end
