class Api::LearningModulesController < ApplicationController
  before_action :authenticate_user, except: :index

  def index
    modules = LearningModule.all

    render json: modules, status: :ok
  end

  def create
    learning_module = LearningModule.new(module_params)
    learning_module.created_by = current_user.auth0_uid
    if learning_module.save
      render json: learning_module, status: :ok
    else
      render json: learning_module.errors, status: :bad_request
    end
  end

  private

  def module_params
    params.require(:learning_module)
          .permit(:title, :description, :industry, :professional_level)
  end
end
