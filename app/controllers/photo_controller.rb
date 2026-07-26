def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to photos_path, notice: "Photo deleted successfully."
end

