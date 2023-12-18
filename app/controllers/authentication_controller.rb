class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
      @user = User.find_by_email(login_params[:email])
      if @user&.authenticate(login_params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        @user.update_columns(token: token)
        time = Time.now + 24.hours.to_i
        # render 'layouts/homepage', locals: { user: @user }
        render 'main/home', user: @user
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end 
    

    def signout
      debugger
        # @user = User.find_by_email(login_params[:email])
        # @user = user
        if @user.present? && !@user.token.nil?
            token = JsonWebToken.encode(user_id: @user.id) 
           @user.update(token:nil)
          render json: 'You have been successfully signed out.'
          # render 'main/home', user: @user
        else
            render json: "Your session is expired"  
       end
    end  


    private
    def login_params
        params.require(:user).permit(:email, :password)
    end



  end