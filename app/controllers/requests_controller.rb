class RequestsController < ApplicationController
  ##before_action :company_signed_in, only: [:new, :create]
  
  def new
    @request = Request.new
  end
  
  def create
    @request = current_company.requests.build(request_params)
    if @request.save
      flash[:success] = "Request created!"
      redirect_to @request
    else
      render :new
    end
  end
  
  def show
    @request = Request.find(params[:id])
  end
  
  private
  
  def request_params
    params.require(:request).permit(:request_title)
  end
  
end
