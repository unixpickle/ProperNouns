class LineDictionary

	attr_reader :words

	def initialize(fileName)
		@words = Array.new
		count = 0
		file = File.new(fileName);
		file.each_line { |line|
			chomped = line.chomp.downcase
			valid = true
			chomped.each_char { |char|
				valid = false if char.unpack("C")[0] > 127
			}
			if valid && !self.include?(chomped)
				@words << chomped
			end
			count += 1
			puts "#{count} lines." if count % 10000 == 0
		}
		file.close
		@words.sort! { |a, b| a <=> b }
	end

	def include?(word)
		minIndex = 0
		maxIndex = @words.count
		while minIndex < maxIndex
			guessIndex = minIndex + ((maxIndex - minIndex) / 2)
			if @words[guessIndex] > word
				maxIndex = guessIndex
			elsif @words[guessIndex] < word
				minIndex = guessIndex + 1
			else
				return true
			end
		end
		return false
	end

end
