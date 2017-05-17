def write(s1,s2,arr,color)
    begin
        File.open('index.html', 'w') do |f|    
            f.puts "<style>"
            f.puts "\tp{\n\t\tbackground-color:#{color}\n\t}"
            f.puts "</style>"
            f.puts "<p>#{s1}</p>\n<p>#{s2}</p>"
            if !arr.empty?
                f.puts "<ol>"
                arr.each do |v| 
                    f.puts "\t<li>#{v}</li>"    
                end
                f.puts "</ol>"
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
arr=["Bulbasaur","Ivysaur","Venusaur","Charmander","Charmeleon","Charizard","Squirtle","Wartortle","Blastoise"]
color="red"
write("hola","mundo",arr,color)