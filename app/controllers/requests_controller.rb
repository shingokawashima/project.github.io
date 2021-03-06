class RequestsController < ApplicationController
  ##before_action :company_signed_in, only: [:new, :create]
  before_action :set_request, only: [:edit, :update, :destroy]
  
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
  
  def edit
  end
  
  def update
    if @request.update(request_params)
      redirect_to root_path , notice: '案件内容を編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    @request.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  def bid
    @request = Request.find(params[:id])
    @bid = Bid.create(bidder: current_student, bidded: @request, bidding_type: "Interested")
    flash[:success] = "Thank you for your interest"
    redirect_to @request
  end
    
  def unbid
    @request = Request.find(params[:id])
    @bid = Bid.find_by(bidder: current_student, bidded: @request).destroy
    flash[:success] = "Delete your interest"
    redirect_to @request
  end
  
    
  private
  
  def request_params
    params.require(:request).permit(:request_name, :description)
  end
  
  def set_request
    @request = Request.find(params[:id])
  end
  
end
