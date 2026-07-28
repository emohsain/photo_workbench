def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to photos_path, notice: "Photo deleted successfully."
end

http_basic_authenticate_with name: Rails.application.credentials.photo_auth[:username],
                              password: Rails.application.credentials.photo_auth[:password]

