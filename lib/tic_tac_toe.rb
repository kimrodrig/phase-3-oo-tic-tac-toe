require "pry"

class TicTacToe
    def initialize
        @board = [
            " ", " ", " ",
            " ", " ", " ", 
            " ", " ", " "
        ]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def display_board
        puts " " + @board[0] + " | " + @board[1] + " | " + @board[2] + " "
        puts "-----------"
        puts " " + @board[3] + " | " + @board[4] + " | " + @board[5] + " "
        puts "-----------"
        puts " " + @board[6] + " | " + @board[7] + " | " + @board[8] + " "
    end

    def input_to_index(input)
        return (input.to_i - 1)
    end

    def move(position, token = "X")
        @board[position] = token
    end

    def position_taken?(position)
        if @board[position.to_i] == " "
            return false
        else
            return true
        end
    end

    def valid_move? position
        if !position_taken?(position) && (position) <= 8 && (position) >= 0
            return true
        else
            return false
        end
    end

    def turn_count
        count = 0
        for i in 0..@board.size - 1
            if position_taken?(i)
                count = count + 1
            end
        end
        return count
    end

    def current_player
        if turn_count.odd?
            return "O"
        else
            return "X"
        end
    end

    def turn
        puts "Where would you like to play?"
        position = input_to_index(gets.chomp)
        if valid_move?(position)
            move(position, current_player)
            display_board
        else 
            turn
        end
    end

    def won?
        for combination in WIN_COMBINATIONS
            if @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]] && @board[combination[0]] != " "
                return combination
            end
        end
        return false
    end

    def full? 
        if turn_count == 9
            return true
        else 
            return false
        end
    end

    def draw?
        if full? && !won?
            return true
        else
            return false
        end
    end

    def over?
        if won?
            return true
        elsif full?
            return true
        else 
            return false
        end
    end

    def winner
        if won?
            if current_player == "X"
                return "O"
            else 
                return "X"
            end
        else 
            return nil
        end
    end

    def play
        until over?
            turn
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
        
    end

end



