class Game 
  
  attr_accessor :player_1, :player_2

  def initialize(player_1 = 'player_1', player_2 = 'player_2')
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
    @turn = 1
    @stop = false
  end

  def finish 
    puts '----  GAME OVER ----'
    puts '----  Good Bye ----'
    @stop = true
  end

  def play(player)
    puts '----  NEW TURN ----'
    a = rand(0..20).to_f
    b = rand(0..20).to_f
    puts "#{player.name}: What does #{a} plus #{b} equal?"
    input = gets.chomp().to_f
    if input == a + b
      puts "YES! You are correct."
      player.score += 1
    else
      puts "#{player.name} Seriously? No!"
      player.chances_left -= 1
      if player.chances_left == 0 and @turn == 1
        puts "player_2 wins with a score of #{@player_2.chances_left}/3"
        self.finish
        return
      elsif player.chances_left == 0 and @turn == 2
        puts "player_1 wins with a score of #{@player_1.chances_left}/3"
        self.finish
        return
      end
    end
    puts "P1: #{@player_1.chances_left}/3 vs P2: #{@player_2.chances_left}/3"
  end

  def play_game

    while !@stop
      player = '?'  
      if @turn == 1
        player = @player_1 
        self.play(player)
        @turn = 2
      else
        player = @player_2
        self.play(player)
        @turn = 1
      end
    end

  end

end