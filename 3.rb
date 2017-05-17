def wordCount(file,string)
    word_count = 0
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(' ').each do |word|
                  word_count += 1 if string.downcase == word.downcase
                end
            end
        end        
        return word_count   
    rescue Exception => msg
        puts msg
    end
end
string = "lorem"
puts "La palabra #{string} se encuentra #{wordCount("file.txt",string)} veces"