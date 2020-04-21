class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "sign-in sucessful!"
    else
      render plain: "sign-in failure!"
    end
  end
end
