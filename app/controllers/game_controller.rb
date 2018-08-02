class GameController < ApplicationController
  def index
       cards = ['1','2','3','4','5','6','11','12','13','14','15','16',
    '21','22','23','24','25','26','31','32','33','34','35','36','40','50'];
    @card = cards.sample(26);
    
    # card shuffle! 
    
    @player1 = Player1.new()
    @player1.firstcard = @card[0]
    @player1.secondcard = @card[1]
    @player1.thirdcard = @card[2]
    @player1.fourthcard = @card[3]
    @player1.save
    
    @player2 = Player2.new()
    @player2.firstcard = @card[4]
    @player2.secondcard = @card[5]
    @player2.thirdcard = @card[6]
    @player2.fourthcard = @card[7]
    @player2.save
    
    @dealer = Dealer.new()
    @dealer.firstcard_1 = @card[8]
    @dealer.secondcard_1 = @card[9]
    @dealer.thirdcard_1 = @card[10]
    
    @dealer.firstcard_2 = @card[11]
    @dealer.secondcard_2 = @card[12]
    @dealer.thirdcard_2 = @card[13]
    
    @dealer.firstcard_3 = @card[14]
    @dealer.secondcard_3 = @card[15]
    @dealer.thirdcard_3 = @card[16]
    
    @dealer.firstcard_4 = @card[17]
    @dealer.secondcard_4 = @card[18]
    @dealer.thirdcard_4 = @card[19]
    
    @dealer.firstcard_5 = @card[20]
    @dealer.secondcard_5 = @card[21]
    @dealer.thirdcard_5 = @card[22]
    
    @dealer.firstcard_6 = @card[23]
    @dealer.secondcard_6 = @card[24]
    @dealer.thirdcard_6 = @card[25]
    @dealer.save
    # card 분배
    
    
    @round = Round.new()
    @round.turn = 0
    @round.save
    #라운드 시작
    
    
  end
  
  def change
    
    @round = Round.last
    @round.turn = @round.turn + 1
    # 라운드 + 1
    @round.save
    
    @player1 = Player1.last
    @player2 = Player2.last
    @color = params[:color]
    @nth = params[:nth]
    @dealer = Dealer.last
    

    
    
    
    
    @cuatro_card = ['0','0','0','0']
    
    if @nth == "1"
      @changecard = @player1.firstcard
    elsif @nth == "2"
      @changecard = @player1.secondcard
    elsif @nth == "3"
      @changecard = @player1.thirdcard
    elsif @nth == "4"
      @changecard = @player1.fourthcard
    else
  
    end
    # 플레이어 카드 제출 = changecard
    @temp = @changecard
    
    if @round.turn == 1
      @cuatro_card[0] = @dealer.firstcard_1
      @cuatro_card[1] = @dealer.secondcard_1
      @cuatro_card[2] = @dealer.thirdcard_1

    elsif @round.turn == 2
      @cuatro_card[0] = @dealer.firstcard_2
      @cuatro_card[1] = @dealer.secondcard_2
      @cuatro_card[2] = @dealer.thirdcard_2
    
    elsif @round.turn == 3
      @cuatro_card[0] = @dealer.firstcard_3
      @cuatro_card[1] = @dealer.secondcard_3
      @cuatro_card[2] = @dealer.thirdcard_3
      
    elsif @round.turn == 4
      @cuatro_card[0] = @dealer.firstcard_4
      @cuatro_card[1] = @dealer.secondcard_4
      @cuatro_card[2] = @dealer.thirdcard_4
      
    elsif @round.turn == 5
      @cuatro_card[0] = @dealer.firstcard_5
      @cuatro_card[1] = @dealer.secondcard_5
      @cuatro_card[2] = @dealer.thirdcard_5
      
    elsif @round.turn == 6
      @cuatro_card[0] = @dealer.firstcard_6
      @cuatro_card[1] = @dealer.secondcard_6
      @cuatro_card[2] = @dealer.thirdcard_6
      
    else
      
    end
    @end_ch = 0
    # 딜러 카드 제출
    3.times do |i|
      if  @cuatro_card[i]  == '40' || @cuatro_card[i]  == '50'
          @changecard = @cuatro_card[i]
          @end_ch = 1
      end
    end
    if @end_ch == 0
      if 'red' == @color
        @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] < '7'
            if @changecard > '6'
              @changecard = @cuatro_card[i]
            else 
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
          else
            if @changecard > '7'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
        
      elsif 'blue'  == @color
        @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] > '7' && @cuatro_card[i] < '17'
            if @changecard < '7' || @changecard > '17'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
          
          else
            if  @changecard < '7' || @changecard > '17'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
                
      elsif 'yellow' == @color
        @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] > '17' && @cuatro_card[i] < '27'
            if @changecard < '17' || @changecard > '27'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
        
          else
            if  @changecard < '17' || @changecard > '27'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
      else
        @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] > '27' && @cuatro_card[i] < '37'
            if @changecard < '27' || @changecard > '37'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
       
          else
            if  @changecard < '27' || @changecard > '37'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
      end 
    end 
    @end_ch = 0
  
     # 적당한 카드로 교환! -------------------------------------------------------------
    
    if @round.turn == 1
     3.times do |i|
       if @cuatro_card[i] == @changecard
         if i == 0
          @cuatro_card[i] = @temp
           @dealer.firstcard_1 =  @temp
         elsif i == 1
            @cuatro_card[i] = @temp
           @dealer.secondcard_1 = @temp
         elsif i == 2
          @cuatro_card[i] = @temp
           @dealer.thirdcard_1 = @temp
         else
         end
       end
     end    
    elsif @round.turn == 2
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_2 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_2 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_2 = @temp
          else
          end
        end
      end 
    elsif @round.turn == 3
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_3 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_3 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_3 = @temp
          else
          end
        end
      end 
    elsif @round.turn == 4
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_4 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_4 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_4 = @temp
          else
          end
        end
      end  
    elsif @round.turn == 5
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_5 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_5 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_5 = @temp
          else
          end
        end
      end    
    elsif @round.turn == 6   
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_6 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_6 = @temp
          elsif i == 2
             @cuatro_card[i] = @temp
            @dealer.thirdcard_6 = @temp
          else
          end
        end
      end
    else
    end
    
    # 딜러도 카드 체인지 됨 ---------------------------------
    
   
    if @nth == "1"
     @player1.firstcard = @changecard
    elsif @nth == "2"
      @player1.secondcard = @changecard
    elsif @nth == "3"
      @player1.thirdcard = @changecard
    else
      @player1.fourthcard = @changecard
    end
    
    # player1 카드 교환  
    

    @player1.save
    
    # player2 카드 체인지 시작 -----------------------------------------------------------

    @color_2 = params[:color_2]
    @mth = params[:mth]

   
  if @color_2 != "stop" # 카드 바꿀 게 있다면!
  
       
    
    if @mth == "4"
      @changecard = @player2.firstcard
    elsif @mth == "5"
      @changecard = @player2.secondcard
    elsif @mth == "6"
      @changecard = @player2.thirdcard
    elsif @mth == "7"
      @changecard = @player2.fourthcard
    else
  
    end
    # 플레이어 카드 제출 = changecard
    @temp = @changecard
   
    
    # 딜러 카드 제출
   @end_ch = 0
        
    3.times do |i|
      if  @cuatro_card[i]  == '40' || @cuatro_card[i]  == '50'
          @changecard = @cuatro_card[i]
          @end_ch = 1
      end
    end
    if @end_ch == 0
      if 'red' == @color
       
          @changecard = @cuatro_card[0]
       
        3.times do |i|
          if @cuatro_card[i] < '7'
            if @changecard > '6'
              @changecard = @cuatro_card[i]
            else 
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
          else
            if @changecard > '7'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
        
      elsif 'blue'  == @color
        @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] > '7' && @cuatro_card[i] < '17'
            if @changecard < '7' || @changecard > '17'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
          
          else
            if  @changecard < '7' || @changecard > '17'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
                
      elsif 'yellow' == @color
          @changecard = @cuatro_card[0]
       3.times do |i|
          if @cuatro_card[i] > '17' && @cuatro_card[i] < '27'
            if @changecard < '17' || @changecard > '27'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
        
          else
            if  @changecard < '17' || @changecard > '27'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
      else
          @changecard = @cuatro_card[0]
        3.times do |i|
          if @cuatro_card[i] > '27' && @cuatro_card[i] < '37'
            if @changecard < '27' || @changecard > '37'
              @changecard = @cuatro_card[i]
            else
              if @cuatro_card[i] > @changecard
                @changecard = @cuatro_card[i]
              end
            end
       
          else
            if  @changecard < '27' || @changecard > '37'
              if @changecard.to_i%10 < @cuatro_card[i].to_i%10 && @changecard != "40" && @changecard != "50"
                @changecard = @cuatro_card[i]
              end
            end
          end  
        end
      end 
    end 
    @end_ch = 0
     
     # 적당한 카드로 교환! -------------------------------------------------------------
    
    if @round.turn == 1
     3.times do |i|
       if @cuatro_card[i] == @changecard
         if i == 0
           @cuatro_card[i] = @temp
           @dealer.firstcard_1 =  @temp
         elsif i == 1
          @cuatro_card[i] = @temp
           @dealer.secondcard_1 = @temp
         elsif i == 2
          @cuatro_card[i] = @temp
           @dealer.thirdcard_1 = @temp
         else
         end
       end
     end    
    elsif @round.turn == 2
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_2 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_2 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_2 = @temp
          else
          end
        end
      end 
    elsif @round.turn == 3
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_3 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_3 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_3 = @temp
          else
          end
        end
      end 
    elsif @round.turn == 4
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_4 =  @temp
          elsif i == 1
           @cuatro_card[i] = @temp
            @dealer.secondcard_4 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_4 = @temp
          else
          end
        end
      end  
    elsif @round.turn == 5
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_5 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_5 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_5 = @temp
          else
          end
        end
      end    
    elsif @round.turn == 6   
      3.times do |i|
        if @cuatro_card[i] == @changecard
          if i == 0
            @cuatro_card[i] = @temp
            @dealer.firstcard_6 =  @temp
          elsif i == 1
            @cuatro_card[i] = @temp
            @dealer.secondcard_6 = @temp
          elsif i == 2
            @cuatro_card[i] = @temp
            @dealer.thirdcard_6 = @temp
          else
          end
        end
      end
    else
    end
    
       # 딜러도 카드 체인지 됨 ---------------------------------
    
   
    if @mth == "4"
     @player2.firstcard = @changecard
    elsif @mth == "5"
      @player2.secondcard = @changecard
    elsif @mth == "6"
      @player2.thirdcard = @changecard
    else
      @player2.fourthcard = @changecard
    end
     
  end #stop 아니라면 player2 교환 
  
    
    
    @dealer.save
    @player1.save
    @player2.save
    
    
    redirect_to '/game/turn'
  end
  
  
  def turn
    @card = ['1','2','3','4','5','6','11','12','13','14','15','16',
    '21','22','23','24','25','26','31','32','33','34','35','36','40','50'];
    @player1 = Player1.last
    @player2 = Player2.last
    @card[0] = @player1.firstcard
    @card[1] = @player1.secondcard
    @card[2] = @player1.thirdcard
    @card[3] = @player1.fourthcard
    
    @card[4] = @player2.firstcard 
    @card[5] = @player2.secondcard 
    @card[6] = @player2.thirdcard 
    @card[7] = @player2.fourthcard 
    
    
    @player2.save
    @round = Round.last
    @dealer = Dealer.last
    
    
  end 
  
  def result
    @player1 = Player1.last
    @player2 = Player2.last
    
    
  end
  
  
  
end
