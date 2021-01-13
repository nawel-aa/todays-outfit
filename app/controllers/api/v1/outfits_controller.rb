class Api::V1::OutfitsController < Api::V1::BaseController
  def index
    @outfits = policy_scope(Outfit)
  end
end
