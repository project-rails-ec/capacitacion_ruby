
#for(int i = 0; i < 10; i++){
#  System.out.printl("Hola")
#} Iteracion en java

#Iteracion en Ruby
#10.times{puts "Hola"}#Lo que esta dentro de llaves es un bloque.
#puts es el print de ruby

#Variables con mayusculas son constantes.
#Ruby solo trabaja con objetos fuertemente tipados.

#declaracion de una Variables
#siempre usar los _ para separar las variables (smail case, no camel case)
my_var = 10
puts my_var

my_var = 10.1
puts my_var

myvar = "hola"
puts myvar

myvar = false
puts myvar

ten = 2 * 5 #esta multiplicancion es lo mismo que escribir -> ten = 2.*(5)
puts ten

ten = 2.*(5) #El * es una funcion
puts ten

#La meta programacion es codigo que escribe codigo

#Creacion de funciones
def saludar()
  puts "Hola"
end

saludar
saludar()#Se puede poner con o sin ()

def saludar(name=nil)#El nulo o NULL en ruby es nil
  if name
    puts "Hola #{name}"#Llamas una variable dentro del puts con #{variable}
  else
    puts "Hola"
  end
end

saludar 'Pablo'
saludar('Eileen')

#metodo con programacion estructurada
def saludar(name=nil)
  print 'Hola'
  print " #{name}" if name
  print "\n"
end

puts '*' * 10
saludar 'Miguel'
puts '*' *10
#Siempre poner '' y solo "" para caracteres especiales


#Cuando se trata de arreglo siempre poner el nombre ary

#Declaracion de un arreglo de vinos
wines = ['Cabernet']


#Agregando contenido al arreglo
wines << 'Merlot'
wines << 'Syrah'
wines << 'Malbec'
wines << 'Carmenere'

#Con .push puedes agregar todo el contenido que quieras al arreglo
wines.push 'Fiesta Brava', 'Fiesta Brava'

#Iteracion de un arreglo 
wines.each{|wine| puts wine.upcase}
#Lo que se pone entre | | son las variables que se van a iterar

def saludar(*names)#El * dentro de la variable se lamma splat que lo ejecuta dentro de los objetos, es decir, que todos los argumentos que escriba los mete dentro de un arreglo, siempre que haya * se entiende que es un arreglo
  if names.any? #Si names esta vacio
    names.each{ |name| puts "Hola #{name}"}
  else
    puts 'Hola'
  end
end

saludar
saludar 'Pablo', 'Maria'

#Metodo optimizado
def saludar(*names)
  puts 'Hola' unless names.any?
  names.each {|name| puts "Hola #{name}"}
end
puts "\n"
puts 'Metodo optimizado'
saludar
saludar 'Leonardo', 'Miri'

puts "\n"

#Creacion de un diccionario (Hash)
SALUDOS = {
  fr: 'Bonjour',
  en: 'Hello',
  de: 'Hallo'
}

SALUDOS.default = 'Que fue'

#Todo en ruby es un objeto y todos tienen la funcion is_a?(tipo de dato)
def saludar(*names)
  options = names.last.is_a?(Hash) ? names.pop : {}
  puts 'Hola' unless names.any?
  names.each {|name| puts "Hola #{name}"}
  options.each do |lang, more_names|#lang es la clave y more_names es el valor
    more_names.each{ |name| puts "#{SALUDOS[lang]} #{name}"}#Cuando no encuentre el lenguaje, por defecto sera hola
  end
end

saludar
saludar 'Leonardo', 'Mari', fr:['steven', 'Lulu']

#Metodo optimizado de manera recursiva
#El :* es conocido como simbolo y utilizado en defaults, es lo mismo poner :* y :default
def saludar(*names)
  puts SALUDOS[:default] unless names.any?
  options = names.last.is_a?(Hash) ? names.pop : {}
  saludar default: names if names.any? 
  options.each do |lang, more_names|#lang es la clave y more_names es el valor
    more_names.each{ |name| puts "#{SALUDOS[lang]} #{name}"}#Cuando no encuentre el lenguaje, por defecto sera que fue
  end
end

puts "\n"
saludar 'Leonardo', 'Mari', fr:['steven', 'Lulu'], default: ['Juan']
puts "\n"
saludar 'Leonardo', 'Mari', fr:['steven', 'Lulu'], '*': ['Juan'], de: ['Marcos'], '*': ['Pepe Grillo']

puts "\n"
puts 'SALUDOS Y DESPEDIDAS'
#creacion de un diccionario de despedidas
DESPEDIDAS = {
  fr: 'Au revoir',
  en: 'GoodBye',
  de: 'Auf wiedersehen'
}

DESPEDIDAS.default = 'Hablamos'

def decir_algo(db, *names)
  puts db[:default] unless names.any?
  options = names.last.is_a?(Hash) ? names.pop : {}
  decir_algo db, default: names if names.any? 
  options.each do |lang, more_names|#lang es la clave y more_names es el valor
    more_names.each{ |name| puts "#{db[lang]} #{name}"}#Cuando no encuentre el lenguaje, por defecto sera hola
  end
end

def saludar(*names)
  decir_algo(SALUDOS, *names)
end

def despedir(*names)
  decir_algo(DESPEDIDAS, *names)
end

saludar 'Leonardo', 'Mari', fr:['steven', 'Lulu'], '*': ['Juan'], de: ['Marcos'], '*': ['Pepe Grillo']

despedir 'Leonardo', 'Mari', fr:['steven', 'Lulu'], '*': ['Juan'], de: ['Marcos'], '*': ['Pepe Grillo']


#Clases
=begin
class Animalito
#Todas las variables de ruby son privadas, no existe publicas y solo puede ser accedidas mediante metodos.
  def initialize(name, type)
    self.name = name #self.name es un metodo 
    self.type = type
    @age = 0
  end
  
  def name
    @name
  end

  def name=(name)
    @name = name
  end
  
  def type
    @type
  end

  def type=(type)
    @type = type
  end

  def age
    @age
  end

  def info
    "NAME: #{name}\nTYPE:#{type}\nAGE: #{age}\n ADULT? #{adult?}"
  end

  def grow!
    puts "[#{name}]: Growing! 1 year"
    @age +=1
  end
end

a = Animalito.new 'Poppy', 'Tiburon'
puts a.info
10.times do
  a.grow!
  puts a.info
end
=end

#Funciones ya hechas en ruby
class Animalito
    attr_accessor :name, :type
    attr_reader :age
  
    def initialize(name, type)
      self.name = name #self.name es un metodo 
      self.type = type
      @age = 0
    end
  
    def info
      "NAME: #{name}\nTYPE:#{type}\nAGE: #{age}\n ADULT? #{adult?}"
    end
  
    def grow!
      puts "[#{name}]: Growing! 1 year"
      @age +=1
    end
  
    def adult?
      @age > 40
    end
  end
  
  class Perrito < Animalito
  
    def initialize(name)
      super(name, 'Perrito')
    end
  
    def adult?
      @age > 3
    end
  end
  
  class Humano < Animalito
  
    def initialize(name)
      super(name, 'Humano')
    end
  
    def adult?
      @age >= 18
    end
  end
  
  p = Perrito.new 'Popy'
  h = Humano.new 'Tiburcio'
  puts p.info
  puts h.info
  
  10.times do
    p.grow!
    h.grow!
  end
  