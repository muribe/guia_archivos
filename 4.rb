def show_lower_stock(file)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(' ')
                if words[1].to_i < 5
                    puts "#{words[0]}\n\n"
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def show_product_stock(file,string)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(' ')
                if words[0].downcase==string.downcase
                    return words[1]
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def show_product(file)
    puts "Ingrese producto para mostrar su stock:\n\n"
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(' ')
                puts "#{words[0]}\n"
            end
            puts "\n"
        end        
    rescue Exception => msg
        puts msg
    end
end
file="stock.txt"
loop do
    puts "1.- Contar Productos"
    puts "2.- Buscar producto"
    puts "3.- Buscar productos con stock menor a 5"
    puts "4.- Salir"
    puts "Ingrese opción:\n"
    op = gets.chomp
    case op
    when "1"
        puts "La cantidad de productos en el archivo son #{File.foreach(file).count }\n"       
    when "2"
        show_product(file)
        producto=gets.chomp
        puts "\n\nEl producto #{producto.capitalize} tiene un stock de #{show_product_stock(file,producto)} unidades\n\n"
    when "3"
        puts "Los productos con stock menor a 5 son:\n\n"
        show_lower_stock(file)
    when "4"        
        break
    else
      puts "Opción no valida!, vuelva a intentarlo"
    end        
end 