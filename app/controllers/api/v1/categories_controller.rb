class Api::V1::CategoriesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: :index
  before_action :set_category, only: %i[show update destroy]

  def index
    @categories = policy_scope(Category)
  end

  def update
    if @category.update(category_params)
      render json: { success: "The category ##{@category.id} has been updated." }
    else
      render_error
    end
  end

  def create
    # Set the properties and link the user
    @category = Category.new(category_params)
    @category.user = current_user

    authorize @category

    if @category.save
      render json: { success: "The category ##{@category.id} has been created." }, status: :created
    else
      render_error
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def render_error
    render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
  end
end
