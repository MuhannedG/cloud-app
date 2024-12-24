class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

    # Redirect to login/sign-up page after sign out
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path # or new_user_registration_path
    end
end
