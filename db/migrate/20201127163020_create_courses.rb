class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references :learning_module
      t.string :title
      t.string :description
      t.integer :subscription_level
      t.string :instructor

      t.timestamps
    end

    remove_column :users, :subscription_type, :string
    add_column :users, :subscription_type, :integer, default: 0
  end
end
