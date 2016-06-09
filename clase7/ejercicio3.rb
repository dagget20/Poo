def factorial(n)
	raise TypeError, "Se esperar un entero" if not n.is_a? Integer
	raise ArgumentError, "argumento incorrecto, se esperar valor mayor a 0, y se recibe #{n}", caller if n < 1
	return 1 if n == 1
	n * factorial(n-1)
end

begin
	x = factorial(1.0)
	puts x
rescue => ex
	puts "#{ex.class}: #{ex.message}"
end
# puts factorial(-3)