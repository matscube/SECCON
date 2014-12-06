require 'socket'
@total = 0
@max = 0
def calScore(slow)
  score =
  bonus = 0
  slows = 0
  slow.each do |c|
    if c == "X" then
    slows = slows + 2
    else
    slows = slows + 1
    end
  end
 
  if slows > 20 then
    if slow[-2] == "/"
      last = slow[-1].to_i
      last = 10 if slow[-1] == "X"
      score = [slow[-3].to_i, 10-slow[-3].to_i, last]
    elsif slow[-1] == "/"
      score = [10, slow[-2].to_i, 10-slow[-2].to_i]
    else
    -3.upto(-1) do |i|
        if slow[i] =~ /[0-9]/ then
          score = score+[slow[i].to_i]
        elsif slow[i] == "X" then
          score = score+[10]
        end
      end
    end
  slow = slow[0..-4]
  else
    score = [slow[-2].to_i,slow[-1].to_i]
  slow = slow[0..-3]
  end
 
  9.times do
    if slow[-1] == "X" then
      bonus = bonus +score[0]+score[1]
      score = [10] + score
    slow = slow[0..-2]
    elsif slow[-1] == "/"  then
      bonus = bonus +score[0]
      score = [slow[-2].to_i, 10-slow[-2].to_i] + score
    slow = slow[0..-3]
    else
      score = [slow[-2].to_i, slow[-1].to_i] + score
    slow = slow[0..-3]
    end
  end
  return score.inject(){|sum, n| sum+n}+bonus
end
 

# number.quals.seccon.jp 31337
TCPSocket.open("number.quals.seccon.jp", 31337) do |s|
  while true do

    while get = s.gets()
      p get
    end

    while true do
      puts s.gets()
      s.flush()
    end

    while true do
      puts s.readchar()      
    end

    while true do
      line = s.gets()
      puts line
      vs = line.split(", ")
      puts vs
      vi = []
      for num in vs
        vi.push(num.to_i)
      end

      line = s.gets()
      puts line
      kMinStr = "The minimum number?"
      kMaxStr = "The maximum number?"

      if line = kMinStr
        vi.sort! {|a, b| a <=> b }
      elsif line = kMaxStr
        vi.sort! {|a, b| b <=> a }
      else
        puts "error"
      end

      s.puts vi[0]
    end

    line = ""
    line = s.readchar()
    puts line
    print line



    until (c = s.readchar()) == "number?" do line = line+c end

    puts c
    puts line

    break


    print line[0..-2]+" ="+s.readchar
    if line =~ /The total score/ then
      print @total.to_s+"\n"
      s.puts @total.to_s"\n"
    elsif line =~ /The hi score/ then
      print @max.to_s+"\n"
      s.puts @max.to_s+"\n"
    else
      ans = calScore(line[0..-2].gsub(/[-G]/,"0").split(""))
      @total = @total + ans
      @max = ans if @max < ans
      print ans.to_s+"\n"
      s.puts ans.to_s+"\n"
    end
  end
end


puts "finished!!"
