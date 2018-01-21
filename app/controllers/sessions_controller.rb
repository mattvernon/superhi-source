class SessionsController < ApplicationController

  def new
    # we don't need any variables in here because we're not adding to the database
  end

  def create
    @email = form_params[:email]
    @password = form_params[:password]

    @user = User.find_by(email: @email).try(:authenticate, @password)

    if @user.present?
      session[:user_id] = @user.id

      flash[:success] = "Welcome!"

      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    reset_session

    flash[:success] = "You are now logged out"

    redirect_to root_path
  end

  def form_params
    params.require(:session).permit(:email, :password)
  end

end
