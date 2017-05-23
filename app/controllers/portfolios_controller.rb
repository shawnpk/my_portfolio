class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end

  def new
   @portfolio_item = Portfolio.new
   3.times { @portfolio_item.technologies.build }
  end

  def edit
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    if @portfolio_item.save
      flash[:notice] = 'Your portfolio item is now live'
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def update
    if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      flash[:notice] = 'Your portfolio item has been updated'
      redirect_to portfolios_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    flash[:notice] = 'Your portfolio item has been deleted'
    redirect_to portfolio_path
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  private
    def set_portfolio
      # @portfolio_item = Portfolio.friendly.find(params[:id])
      @portfolio_item = Portfolio.find(params[:id])
    end
end
