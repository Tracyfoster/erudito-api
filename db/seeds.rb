# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
INDUSTRY = %w[Finance Insurane Real-Estate].freeze
PROF_TYPES = %w[beginner advanced expert].freeze

def create_learning_modules
  FactoryBot.create_list(:learning_module, 5,
                         industry: INDUSTRY.shuffle.last,
                         professional_level: PROF_TYPES.shuffle.last)
end

def create_basic_course(learning_module)
  FactoryBot.create(:course,
                         learning_module: learning_module,
                         subscription_level: "basic")
end
def create_premium_course(learning_module)
  FactoryBot.create(:course,
                         learning_module: learning_module,
                         subscription_level: :premium)
end
def create_professional_course(learning_module)
  FactoryBot.create(:course,
                         learning_module: learning_module,
                         subscription_level: 2)
end


learning_modules = create_learning_modules
learning_modules.each do |learning_module|
  create_basic_course(learning_module)
  create_premium_course(learning_module)
  create_professional_course(learning_module)
end
