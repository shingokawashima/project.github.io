class AddRequestTitleToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :request_title, :string
  end
end
