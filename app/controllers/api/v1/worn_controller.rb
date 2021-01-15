class Api::V1::WornController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: :create
  before_action :set_item, only: :create

  def index
    @worn = policy_scope(Worn).includes(:outfit)
    @worn = @worn.where(rejected: params[:rejected]) if params[:rejected]
    return unless params[:date]

    # Parse the date and make sure it is in UTC time.
    date = Time.parse(params[:date]).utc
    @worn = @worn.where(created_at: date.midnight..(date.midnight + 1.day))
  end

  def create
    # Set the properties and link the user
    @worn = Worn.new(worn_params)
    @worn.user = current_user
    @worn.outfit = Outfit.find(params[:outfit])

    authorize @worn

    if @worn.save
      render json: { success: "The choice ##{@worn.id} has been created." }, status: :created
    else
      render_error
    end
  end

  private

  def set_worn
    @worn = Worn.find(params[:id])
    authorize @worn
  end

  def worn_params
    params.require(:worn).permit(:rejected)
  end

  def render_error
    render json: { errors: @worn.errors.full_messages }, status: :unprocessable_entity
  end
end
