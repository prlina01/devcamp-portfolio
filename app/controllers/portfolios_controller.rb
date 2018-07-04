class PortfoliosController < ApplicationController
  
  def index
    @portfolio_items = Portfolio.all
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live'} 
      end
  end
end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    respond_to do |format|
      @portfolio_item = Portfolio.find(params[:id])
      if @portfolio_item.update_attributes(portfolio_params)
        format.html {redirect_to portfolios_path, notice: 'Portfolio was updated successfully'}
      else
        format.html { render :edit}
      end
    end
  end


  private
  def portfolio_params
    params.require(:portfolio).permit(:title,:subtitle,:body)
  end
end
