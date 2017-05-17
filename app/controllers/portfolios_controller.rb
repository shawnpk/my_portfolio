class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
   @portfolio_item = Portfolio.new 
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    if @portfolio_item.save
      flash[:notice] = 'Your portfolio item is now live'
      redirect_to portfolios_path
    else
      render :new
    end
  end
end
