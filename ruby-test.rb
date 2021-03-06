option = 0
while option != 4
  puts '--------------------------------------------------------'
  puts 'Bienvenidos, ingrese algunas de las siguientes opciones:'
  puts '--------------------------------------------------------'
  puts '1-. Crear archivo de cada alumno'
  puts '2-. Cantidad de inasistentes'
  puts '3-. Ver lista de alumnos aprobados'
  puts '4-. Salir'
  option = gets.chomp.to_i
  if option == 1
    file = File.open('scores.txt', 'r')
    data = file.readlines
    data = data.map { |e| e.split(', ').map(&:chomp) }
    file.close
    average = 0
    puts '--------------------------------------------------------'
    puts 'Promedio de cada alumno'
    puts '--------------------------------------------------------'
    data.each do |e|
      average = (e[1].to_f + e[2].to_f + e[3].to_f + e[4].to_f + e[5].to_f) / data.lenght
      puts "#{e[0]} tiene un promedio de #{average}"
      file = File.new("#{e[0]}.txt", 'w')
      file.puts average
      file.close
    end
    puts '--------------------------------------------------------'
  elsif option == 2
    file = File.open('scores.txt', 'r')
    data = file.readlines
    data = data.map { |e| e.split(', ').map(&:chomp) }
    file.close
    sum = 0
    data.each do |e|
      sum += e.select { |j| j == 'A' }.length
    end
    puts '--------------------------------------------------------'
    puts "La cantidad de inasistencias es: #{sum}"
    puts '--------------------------------------------------------'
  elsif option == 3
    file = File.open('scores.txt', 'r')
    data = file.readlines
    data = data.map { |e| e.split(', ').map(&:chomp) }
    file.close
    puts '--------------------------------------------------------'
    puts 'Ingrese el promedio aceptable entre 1 y 10'
    limit = gets.chomp.to_i
    puts '--------------------------------------------------------'
    puts 'Lista de alumnos aprobados:'
    data.select do |e|
      average = (e[1].to_f + e[2].to_f + e[3].to_f + e[4].to_f + e[5].to_f) / 5
      puts "#{e[0]}: #{average}" if average > limit
    end
    puts '--------------------------------------------------------'
  end
end
puts '--------------------------------------------------------'
puts 'Ha salido del programa'
puts '--------------------------------------------------------'
