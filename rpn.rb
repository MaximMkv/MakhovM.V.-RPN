def standart_to_rpn(exp)
    prt = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }  #Priority
    res = []
    stack = []
  
    exp.each_char do |symb|
      if symb.match?(/\d+/)  #Whether symbol is a number
        res << symb
      elsif symb == '('
        stack.push(symb)
      elsif symb == ')'
        while !stack.empty? && stack.last != '('
          res << stack.pop
        end
        stack.pop
      elsif prt.key?(symb)  #Whether symbol is a operation
        while !stack.empty? && prt[symb] <= (prt[stack.last] || 0)
          res << stack.pop
        end
        stack.push(symb)
      end
    end
  
    while !stack.empty?
      res << stack.pop
    end
  
    return res.join(' ')
  end
  
  #Entering data
  puts "Please enter standart expression"
  standExp = gets.chomp
  #Output
  rpnExp = standart_to_rpn(standExp)
  puts "Result in RPN: #{rpnExp}"
  