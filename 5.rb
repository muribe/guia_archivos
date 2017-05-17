def sum_stock(arr)
    return (((arr[1].downcase != "nr") ? arr[1].to_i : 0) + ((arr[2].downcase!='nr') ? arr[2].to_i : 0) + ((arr[3].downcase!='nr') ? arr[3].to_i : 0))
end
def show_lower_stock(file)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(',')
                if sum_stock(words) < 5
                    puts "#{words[0]}\n\n"
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def show_product_total_stock(file)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(',')
                puts "#{words[0]}: " + sum_stock(words).to_s+"\n\n"
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def show_nr_product(file)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(',')
                if words[1].downcase=="nr" || words[3].downcase=="nr" || words[3].downcase=="nr"
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
                words = line.split(',')
                if words[0].downcase==string.downcase
                    return sum_stock(words)
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def show_product(file)
    puts "Ingrese producto para mostrar su stock:\n\n\n"
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(',')
                puts "#{words[0]}\n"
            end
            puts "\n"
        end        
    rescue Exception => msg
        puts msg
    end
end
def register_product(file, producto)
    begin
        File.open(file, 'a') do |f|    
            f.puts "#{producto}"
        end        
    rescue Exception => msg
        puts msg
    end
end
file="bodega.txt"
loop do
    puts "1.- Suma de Stock Productos"
    puts "2.- Buscar producto y mostrar stock"
    puts "3.- Mostrar productos sin registrar por bodega y stock menor a 5"
    puts "4.- Agregar producto y stock"
    puts "5.- Salir"
    puts "Ingrese opción:\n"
    op = gets.chomp
    case op
    when "1"
        puts "La cantidad total de stock por producto son: \n"
        show_product_total_stock(file)
        puts "La cantidad total productos son: #{ File.foreach(file).count}\n\n"
    when "2"
        show_product(file)
        producto=gets.chomp
        puts "\n\nEl producto #{producto.capitalize} tiene un stock de #{show_product_stock(file,producto)} unidades en todas las bodegas\n\n"
    when "3"
        puts "Los productos sin registrar son:\n\n"
        show_nr_product(file)
        puts "Los productos con stock menor a 5 son:\n\n"
        show_lower_stock(file)
    when "4"    
        puts "Ingrese producto con su stock separado por comas ej(producto,1,2,3) NR para no registrar en la bodega:\n\n\n"
        producto=gets.chomp
        register_product(file,producto)
    when "5"        
        break
    else
      puts "Opción no valida!, vuelva a intentarlo"
    end        
end 