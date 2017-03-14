class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :type
      t.string :subject_id
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
