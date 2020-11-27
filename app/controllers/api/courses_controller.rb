class Api::CoursesController < ApplicationController
  before_action :authenticate_user, except: :all_courses
  before_action :set_learning_module, except: :all_courses

  def index
    courses = @learning_module.courses

    render json: courses, status: :ok
  end

  def all_courses
    render json: Course.all, status: :ok
  end

  def create
    course = Course.new(module_params)
    if course.save
      render json: course, status: :ok
    else
      render json: course.errors, status: :bad_request
    end
  end

  private

  def module_params
    params.require(:course)
          .permit(:title, :description, :subscription_level, :instructor)
  end

  def set_learning_module
    @learning_module = LearningModule.find(params[:learning_module_id])
  end
end
