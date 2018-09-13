class GamepokersController < ApplicationController
  def new
    @gamepoker = GamePoker.new
  end
  
  def judge
    @gamepoker = GamePoker.new(gamepoker_params)
      hand = @gamepoker.hand.split
  
    	suits = Array.new
    	numbers = Array.new
    	
    	hand.each do |h|
    		suits.push h[0]
    		numbers.push h[1]
    	end
    
    	def same_number_count
    	  hand = @gamepoker.hand.split
    	  numbers = Array.new
    	  hand.each do |h|
    	    numbers.push h[1]
    	  end
    		numbers.each_with_object(Hash.new(0)){|v,o| o[v]+=1}.values.sort.reverse
    	end
    
    	def straight?
    	  hand = @gamepoker.hand.split
    	  numbers = Array.new
    	  hand.each do |h|
    	    numbers.push h[1]
    	  end
    		process = numbers.sort.map{|r|r.to_i - numbers[0].to_i}
    		process == [0,1,2,3,4] || process == [0,9,10,11,12]
    		
    	end
    
    	def flush?
    	  hand = @gamepoker.hand.split
    	  
    	  suits = Array.new
    	  hand.each do |h|
    	    suits.push h[0]
    	  end
    	  
    		suits.uniq.size == 1
    	end
    
    	case same_number_count
    		when [4,1]
    			@yaku = "フォー・オブ・ア・カインド"
    			render :new
    		when [3,2]
    			 @yaku = "フルハウス"
    			render :new
    		when [3,1,1]
    			@yaku = "スリー・オブ・ア・カインド"
    			render :new
    		when [2,2,1]
    			@yaku = "ツーペア"
    			render :new
    		when [2,1,1,1]
    			@yaku = "ワンペア"
    			render :new
    		else
    			case [straight?, flush?]
    				when [true, false]
    				  @yaku = "ストレート"
    					render :new
    				when [false, true]
    					@yaku = "フラッシュ"
    					render :new
    				when [true, true]
    					@yaku = "ストレートフラッシュ"
    					render :new
    				else
    					@yaku = "ハイカード"
    					render :new
    			end
    	end
  end
  
  private
  
  def gamepoker_params
    params.require(:game_poker).permit(:hand)
  end
end
