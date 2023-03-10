class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: %i[index index_map set_featured], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: %i[index index_map set_featured], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  around_action :set_locale_from_url
  before_action :configure_permitted_parameters,
    if: :devise_controller?

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
      end
  include Pagy::Backend
  before_action :set_locale

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

end
