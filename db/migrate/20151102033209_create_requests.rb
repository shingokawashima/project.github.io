class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_name
      t.text :description
      t.string :required_skills
      t.string :required_background
      t.integer :budget
      t.integer :hours
      t.date :period
      t.string :type
      t.string :emergent

      t.timestamps null: false
    end
  end
end
