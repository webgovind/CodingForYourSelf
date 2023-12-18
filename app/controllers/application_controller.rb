class ApplicationController < ActionController::Base
    def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request
        debugger
        header = @user.token
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
end
  
  
  
  
  
  
  