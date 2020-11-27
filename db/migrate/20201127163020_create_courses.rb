class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references :learning_module
      t.string :title
      t.string :description
      t.string :subscription_level
      t.string :instructor

      t.timestamps
    end
  end
end
