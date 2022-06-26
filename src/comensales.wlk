/*
 Recordá que podes usar el mensaje x.even() a un número para saber si es par.
 */
import comidas.*

class Comensales {
	var property peso
	var property comidasIngeridas = []
	
	method leAgrada(comida)
	
	method comer(comida) = comidasIngeridas.add(comida)
	
	method estaSatisfecho() = self.pesoComidasIngeridas() >= peso*0.01 && self.condAdicional()
	
	method pesoComidasIngeridas() = comidasIngeridas.sum({ c => c.peso() })
	
	method cantidadIngerida() = comidasIngeridas.size()
	
	method condAdicional()
}

class Veganos inherits Comensales{
	override method leAgrada(comida) = comida.aptoVegano() && comida.valoracion() > 85
	
	override method condAdicional() = not comidasIngeridas.any({ c => c.esAbundante() })
}

class HambrePopular inherits Comensales{
	override method leAgrada(comida) = comida.esAbundante()
	
	override method condAdicional() = true
}

class PaladarFino inherits Comensales{
	override method leAgrada(comida) = comida.peso().between(150,300) && comida.valoracion() > 100
	
	override method condAdicional() = self.cantidadIngerida()%2 == 0
}
