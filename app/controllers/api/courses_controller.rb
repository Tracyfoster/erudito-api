class Api::CoursesController < ApplicationController
  before_action :authenticate_user
  before_action :set_learning_module, except: :enrollable_courses
  before_action :set_course

  def index
    courses = @learning_module.courses

    render json: courses, status: :ok
  end

  def enrollable_courses
    render json: current_user.enrollable_courses, status: :ok
  end

  def create
    course = Course.new(module_params)
    if course.save
      render json: course, status: :ok
    else
      render json: course.errors, status: :bad_request
    end
  end

  def show
    if @course.present?
      render json: @course, status: :ok
    else
      render json: { error: "You do not have access to this course" },
             status: :not_found
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

  def set_course
    @course = current_user.enrollable_courses.find_by(id: params[:id])
  end
end
