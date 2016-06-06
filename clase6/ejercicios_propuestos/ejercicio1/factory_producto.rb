class Producto_factory
  def self.create(type, *args)
    case type
    when "cd"
      Cd.new(*args)
    when "dvd"
      Dvd.new(*args)
    when "bluray"
      Bluray.new(*args)
    end
  end
end
