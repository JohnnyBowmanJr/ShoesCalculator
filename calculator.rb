Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 280 do
  stack :margin => 50 do
    @output = edit_line
    background green

    flow do
      
      %w(7 8 9 4 5 6 1 2 3 0 + / * - C = sqrt).each do |op|      
        button op do
          op.to_i      
          case op 
            when "C"
              delete_input
            when "="
              eval_expression
            when "sqrt"
              square_root
            else
              append op
          end
        end
      end
    end
    
  end
  
  # Stick a string on the end of our input
  #

  def square_root
    @input = Math.sqrt(@input.to_i).to_s
    @output.text = @input

  end

  def delete_input
    @input = ""
    @output.text = @input
  end

  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
  
end
