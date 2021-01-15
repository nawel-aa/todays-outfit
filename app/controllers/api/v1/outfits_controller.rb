class Api::V1::OutfitsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: %i[index show]
  before_action :set_outfit, only: %i[show update destroy]

  def index
    if params[:categories]
      @outfits = policy_scope(Outfit).joins(:categories).where(categories: { id: JSON.parse(params[:categories]) }).distinct

      ########################
      # NOTE: 
      # if displaying non selected categories is not necessary anymore,
      # this query would be faster
      # 
      # @outfits = policy_scope(Outfit)
      #            .includes(:categories, :items)
      #            .where(categories: { id: JSON.parse(params[:categories]) })
      ########################
    else
      @outfits = policy_scope(Outfit).includes(:categories, :items)
    end
  end

  def show
    @last_date_worn = @outfit.worn.empty? ? nil : @outfit.worn.where(rejected: false).last.created_at
  end

  def update
    # Set the properties
    @outfit.name = outfit_params[:name]
    @outfit.photo = outfit_params[:photo]
    @outfit.weather = outfit_params[:weather]

    # Set the relationships
    change_outfit_relationships

    if @outfit.save
      render json: { success: "The outfit ##{@outfit.id} has been updated." }
    else
      render_error
    end
  end

  def create
    # Set the properties
    @outfit = Outfit.new(outfit_params)

    # Set the relationships
    change_outfit_relationships

    authorize @outfit

    if @outfit.save
      render json: { success: "The outfit ##{@outfit.id} has been created." }, status: :created
    else
      render_error
    end
  end

  def destroy
    @outfit.destroy
    head :no_content
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
    authorize @outfit
  end

  def change_outfit_relationships
    @outfit.user = current_user
    @outfit.items = Item.find(params[:items])
    @outfit.categories = Category.find(params[:categories])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :photo, :weather)
  end

  def render_error
    render json: { errors: @outfit.errors.full_messages }, status: :unprocessable_entity
  end
end
