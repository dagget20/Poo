class AlumnoFactory
  def self.create(type, codigo, nombre, apellido)
    case type
      when "traslado"
        AlumnoTraslado.new(codigo, nombre, apellido)
      when "becado"
        AlumnoBecado.new(codigo, nombre, apellido)
      when "regular"
        AlumnoRegular.new(codigo, nombre, apellido)
    end
  end
end

