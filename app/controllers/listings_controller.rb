class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order]
  before_action :authenticate_user!, except: [:home, :index]
  before_action :authorize_user, only: [:edit, :update, :destroy]



  # GET /listings or /listings.json
  def index
    @listings = Listing.available_listings
    
    unless params[:min_age].blank?
      @listings = @listings.where('age >= ?', params[:min_age])
    end
    
    unless params[:max_age].blank?
      @listings = @listings.where('age <= ?', params[:max_age])
    end

    if params[:species]!= 'all' && !params[:species].blank?
      @listings = @listings.where(species: params[:species])
    end
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.species = @listing.species.downcase
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end


    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def place_order

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def authorize_user
      if @listing.user_id != current_user.id
        redirect_to listings_path, notice:"Only the Owner can do that!"
      end
    end
    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:user_id, :species, :age, :price, :name, :description, :sold, :picture)
    end
end
