class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :type
      t.string :instructor_id
      t.string :email
      t.string :first
      t.string :middle
      t.string :last

      t.timestamps
    end
  end
end
