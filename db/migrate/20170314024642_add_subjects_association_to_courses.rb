class AddSubjectsAssociationToCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_courses, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :course, index: true
    end
  end
end
