class Bid < ActiveRecord::Base
  belongs_to :bidder_id, class_name: "Student"
  belongs_to :bidded_id, class_name: "Company"
  
end
