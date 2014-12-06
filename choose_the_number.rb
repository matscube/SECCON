require 'socket'

def getNumbers socket
  print "Server: "
  line = ""

  while true do
    char = socket.readchar()
    print char
    return line if char == "\n"
    line += char
  end
end

def getString socket
  print "Server: "
  line = ""

  while true do
    char = socket.readchar()
    print char
    line += char
    return line if char == "?"
  end
end

def doNothing socket
  while ch = socket.readchar()
    print ch
  end
end

TCPSocket.open("number.quals.seccon.jp", 31337) do |s|
# for debug
# while str = STDIN.gets
# s = STDIN
  while true do

    line = getNumbers s
    vs = line.split(", ")
    vi = []
    for num in vs
      vi.push(num.to_i)
    end

    line = getString s
    kMinStr = "The minimum number?"
    kMaxStr = "The maximum number?"

    if line == kMinStr
      vi.sort! {|a, b| a <=> b }
    elsif line == kMaxStr
      vi.sort! {|a, b| b <=> a }
    else
      puts "error"
    end

#    puts "vector: " + vi.to_s
    puts "\nClient: ans = " + vi[0].to_s
    puts ""

    s.print vi[0]
  end
end


puts "finished!!"
