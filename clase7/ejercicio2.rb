def promedio(nota1, nota2, nota3)
	raise ArgumentError, "La nota 1 debe estar entre '0 y 20, y registro #{nota1}",
	caller if nota1 < 0 or nota1 > 20
	raise ArgumentError, "La nota 2 debe estar entre '0 y 20, y registro #{nota2}",
	caller if nota2 < 0 or nota2 > 20
	raise ArgumentError, "La nota 3 debe estar entre '0 y 20, y registro #{nota3}",
	caller if nota3 < 0 or nota3 > 20

	promedio = (nota1 + nota2 + nota3) / 3
	return promedio.round.(2)
end

promedio(15,17,25)