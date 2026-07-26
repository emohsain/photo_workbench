class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Photo uploaded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end
def edit
  @photo = Photo.find(params[:id])
end
def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to photos_path, notice: "Photo deleted successfully."
end
def update
  @photo = Photo.find(params[:id])
  if @photo.update(photo_params)
    redirect_to @photo, notice: "Photo updated successfully."
  else
    render :edit, status: :unprocessable_entity
  end
end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :taken_at, :image)
  end
end
