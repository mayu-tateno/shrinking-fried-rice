class FriedRicesController < ApplicationController
  def preparation
    @fried_rice = FriedRice.new
  end

  def result
    @fried_rice = FriedRice.new(fried_rice_params)

    if @fried_rice.valid?
      shrink_rate = 0.7
      warmed_fried_rice_amount = @fried_rice.amount * shrink_rate
      warming_time = @fried_rice.minute * 60 + @fried_rice.second
      ideal_warming_time = case @fried_rice.amount
                           when 0...100
                             240
                           when 100...200
                             270
                           when 200...300
                             300
                           when 300...400
                             330
                           when 400...500
                             390
                           when 500...600
                             420
                           when 600...700
                             480
                           when 700..800
                             540
                           end

    case warmed_fried_rice_amount
    when 0...200
      @amount_evaluation = '量が少ない…！'
      amount_score = 1
    when 200...350
      @amount_evaluation = '量はちょっと物足りない…'
      amount_score = 2
    when 350...380
      @amount_evaluation = 'ちょうど良い量！'
      amount_score = 3
    when 380...500
      @amount_evaluation = 'ちょっと量が多かったかも…'
      amount_score = 2
    when 500...800
      @amount_evaluation = '…１人前の量ではない！'
      amount_score = 1
    end

    if warming_time - ideal_warming_time < -30
      @warming_time_evaluation ='まだ冷たい部分が残っている…'
      warming_time_score = 1
    elsif warming_time - ideal_warming_time >= -30 && warming_time - ideal_warming_time < -15
      @warming_time_evaluation = 'もう少し温めた方がいいかも'
      warming_time_score = 2
    elsif warming_time - ideal_warming_time >= -15 && warming_time - ideal_warming_time <= 15
      @warming_time_evaluation = 'ちょうどいい温め具合！'
      warming_time_score = 3
    elsif warming_time - ideal_warming_time > 15 && warming_time - ideal_warming_time <= 30
      @warming_time_evaluation = '少し温めすぎ？'
      warming_time_score = 2
    elsif warming_time - ideal_warming_time > 30 && warming_time - ideal_warming_time <= 60
      @warming_time_evaluation = '温めすぎてしなしな…'
      warming_time_score = 1
    else
      @warming_time_evaluation = '温めすぎて水分が飛んでガリガリに硬い部分が…'
      warming_time_score = 1
    end

    @general_comment = case amount_score * warming_time_score
                       when 1..3
                         '残念！'
                       when 4..8
                         'まあこんなもの'
                       when 9
                         '美味！！'
                       end
    else
      render :preparation
    end
  end

  private

  def fried_rice_params
    params.require(:fried_rice).permit(:amount, :minute, :second)
  end
end
