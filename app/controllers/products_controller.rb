class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.price = (@product.price.to_f * 100).round
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product.price = (params[:product][:price].to_f * 100).round if params[:product][:price].present?
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name, :description, :short_description, :price, :featured_image, :inventory_count ])
    end
end
