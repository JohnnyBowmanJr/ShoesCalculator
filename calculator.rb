Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 280 do
  stack :margin => 50 do
    @output = edit_line
    
    flow do
      
      %w(7 8 9 4 5 6 1 2 3 0 + / * -).each do |op|      
    
      case button
        when "C"
          delete_input
        when "="
          eval_expression
        else
          append op
      end
  end


        
    
  end
  
  # Stick a string on the end of our input
  #

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
