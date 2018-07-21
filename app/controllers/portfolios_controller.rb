class PortfoliosController < ApplicationController
  
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.by_position
  end
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def new
    @portfolio_item = Portfolio.new
  end


  def create
      respond_to :html, :json
    @portfolio_item = Portfolio.new(portfolio_params)

      if @portfolio_item.save
          redirect_to portfolios_path, notice: 'Portfolio was successfully created.' 
      end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: "Portfolio #{@portfolio_item} has been successfully destroyed"}
    end
  end


  private
  def portfolio_params
    params.require(:portfolio).permit(:title,:subtitle,:body,
                  :technologies_attributes => [:name, :id, :_destroy])
  end
end
