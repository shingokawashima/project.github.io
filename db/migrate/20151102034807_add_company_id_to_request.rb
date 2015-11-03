class AddCompanyIdToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :company, index: true
  end
end
