class AddGenderToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :gender, :string
  end
end
