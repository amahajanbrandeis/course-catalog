class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :type
      t.string :course_id
      t.string :code
      t.string :name
      t.text :description
      t.float :credit
      t.boolean :independent_study
      t.string :requirements

      t.timestamps
    end
  end
end
