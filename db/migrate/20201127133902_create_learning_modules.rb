class CreateLearningModules < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_modules do |t|
      t.string :title
      t.string :description
      t.string :industry
      t.string :professional_level

      t.timestamps
    end
  end
end
