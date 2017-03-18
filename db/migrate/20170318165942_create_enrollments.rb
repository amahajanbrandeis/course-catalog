class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.datetime :enrollment_date
      t.timestamps
    end
  end
end
