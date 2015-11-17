class ImageSlidesController < ApplicationController
  before_action :set_image_slide, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @image_slides = ImageSlide.all
  end
  def new
    @image_slide = ImageSlide.new
  end
  def create
    @image_slide = ImageSlide.create(image_slide_params)
    if @image_slide.save
      flash[:notice] = @image_slide.title + t('message.success.create')
      redirect_to  image_slides_path
    else
      flash[:warning] = t('message.unsuccess.create')
      render 'new'
    end
  end

  def edit
    
  end

  def update
    @image_slide.update_attributes(image_slide_params)
    if @image_slide.save
      flash[:notice] = @image_slide.title + t('message.success.update')
      redirect_to image_slides_path
    else
      flash[:warning] = t('message.unsuccess.create')
      render 'edit'
    end
  end

  def destroy
    if @image_slide.destroy
      flash[:notice] = @image_slide.title + t('message.success.delete')
      redirect_to image_slides_path
    else
      flash[:warning] = @image_slide.title + t('message.unsuccess.delete')
      redirect_to image_slides_path
    end
  end

  private
    def set_image_slide
      @image_slide = ImageSlide.find(params[:id])
    end
    def image_slide_params
      params.require(:image_slide).permit(:title, :description, :image)
    end

end
