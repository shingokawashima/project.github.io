class StudentsController < ApplicationController
  def index
    @requests = Request.all
  end
end
