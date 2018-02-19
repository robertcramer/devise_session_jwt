class Api::AuthenticationController < Api::BaseController

  def sign_in
    command = AuthenticateUser.call(user_params[:email], user_params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def sign_up
    if User.find_by_email(user_params[:email])
      render json: { error: 'Email already taken' }, status: :unauthorized
    else
      user = User.create(email: user_params[:email], password: user_params[:password])
      user.send_confirmation_instructions
      render json: { success: 'User created. Please confirm account.' }, status: :ok
    end
  end

  def forgot_password
    user = User.find_by_email(user_params[:email])
    if !user
      render json: { error: 'No user found with that email.' }, status: :not_found
    else
      user.send_reset_password_instructions
      render json: { success: 'Email has been sent with a link to reset password.' }, status: :ok
    end
  end

  private

  def user_params
    params[:user]
  end
end
