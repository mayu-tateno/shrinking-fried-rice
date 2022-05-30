class FriedRicesController < ApplicationController
  def preparation
    @fried_rice = FriedRice.new
  end

  def result
    @fried_rice = FriedRice.new(fried_rice_params)
    if @fried_rice.valid?
      @amount_evaluation, @warming_time_evaluation, @general_comment = @fried_rice.calculate
    else
      render :preparation
    end
  end

  private

  def fried_rice_params
    params.require(:fried_rice).permit(:amount, :minute, :second)
  end
end
