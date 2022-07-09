class PurchasesController < ApplicationController
  before_action :authenticate_user!

  # what method to call to create the user - listng purchase association?
  # how to pass @listing into create from the listing show view
  def create
    current_user.purchases.create(listing_id: params[:listing_id])
    flash[:notice] = 'Your purchase was succesful'
    redirect_to root_path
  end
end
