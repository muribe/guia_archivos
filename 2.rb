def count(file)
    return File.foreach(file).count
end

puts "El archivo tiene #{count("index.html")} lineas"