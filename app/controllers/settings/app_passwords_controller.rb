class Settings::AppPasswordsController < SettingsController
  def index
    @app_passwords = current_user.app_passwords.order(created_at: :desc)
  end

  def create
    app_password = current_user.app_passwords.create

    redirect_to settings_app_passwords_path, notice: "App password created: #{app_password.token}"
  end

  def destroy
    app_password = current_user.app_passwords.find(params[:id])
    app_password.destroy!

    redirect_to settings_app_passwords_path, notice: "App password deleted"
  end
end
