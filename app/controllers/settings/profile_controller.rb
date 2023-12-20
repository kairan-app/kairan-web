class Settings::ProfileController < SettingsController
  def show
    @user = current_user
  end

  def update
    if current_user.update(name: params[:name])
      redirect_to settings_profile_path, notice: "Name updated"
    else
      redirect_to settings_profile_path, alert: "Name update failed"
    end
  end
end
