str = "8, -2, 100, -100"
vs = str.split(", ")
vi = []
for num in vs
	vi.push(num.to_i)
end

vi.sort! {|a, b| a <=> b }
vi.sort! {|a, b| b <=> a }

for num in vi
	puts num
end