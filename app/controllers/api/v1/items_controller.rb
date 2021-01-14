class Api::V1::ItemsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: %i[index show]
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = policy_scope(Item)
  end

  def show
    @last_date_worn = @item.worn.empty? ? nil : @item.worn.where(rejected: false).last.created_at
  end

  def update
    if @item.update(item_params)
      render json: { success: "The item ##{@item.id} has been updated." }
    else
      render_error
    end
  end

  def create
    # Set the properties and link the user
    @item = Item.new(item_params)
    @item.user = current_user

    authorize @item

    if @item.save
      render json: { success: "The item ##{@item.id} has been created." }, status: :created
    else
      render_error
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:name, :photo, :item_type)
  end

  def render_error
    render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
  end
end
