class CompaniesController < ApplicationController
  def index
    if company_signed_in?
      @requests = current_company.requests
    end
  end
end
