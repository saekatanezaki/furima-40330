class ApplicationController < ActionController::Base
  before_action :basic_auth
end

#   private

#   # def basic_auth
#   #   authenticate_or_request_with_http_basic do |username, password|
#   #     username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
#   #   end
#   # end
# end

# class ApplicationController < ActionController::Base
# <<<<<<< Updated upstream
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(
#       :sign_up, keys: [:nickname, :birth_date, :first_name, :last_name, :first_name_kana, :last_name_kana]
#     )
# =======
# before_action :basic_auth

#   private

#   def basic_auth
#     authenticate_or_request_with_http_basic do |username, password|
#       username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
#     end
#   end
# end
