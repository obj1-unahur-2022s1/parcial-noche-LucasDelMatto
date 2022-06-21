class Plato {
	method peso()
	
	method valoracion()
	
	method aptoVegano()
	
	method esAbundante() = self.peso()>250
	
}

class Provoleta inherits Plato{
	var property peso
	var property tieneEspecias
	
	override method aptoVegano() = not self.tieneEspecias()
	
	method esEspecial() = self.esAbundante() || self.tieneEspecias()
	
	override method valoracion() = if(self.esEspecial()){120}else{80}
}


class HamburguesaCarne inherits Plato{
	var property pan
	
	override method peso() = 250
	
	override method aptoVegano() = false
	
	override method valoracion() = 60 + pan.valoracion()
}

class HamburguesaVegana inherits HamburguesaCarne{
	var property legumbre
	
	override method aptoVegano() = true
	
	override method valoracion() = super() + 17.min(2*legumbre.size())
}

class Parrillada inherits Plato{
	var property cortesPedidos
	
	method pedir(carne) = cortesPedidos.add(carne)
	
	override method peso() = cortesPedidos.sum({ c => c.peso() })
	
	override method aptoVegano() = false
	
	method calidadMaximaCortes() = cortesPedidos.max({ c => c.calidad() }).calidad()
	
	method cantidadCortesPedidos() = cortesPedidos.size()
	
	override method valoracion() = 15 * self.calidadMaximaCortes() - self.cantidadCortesPedidos()
}

/*Clase corte de carne para la parrillada */
class CorteDeCarne{
	var property calidad
	var property peso
}

/*Objetos panes para las hamburguesas */
object panIndustrial{
	const property valoracion = 0
}

object panCasero{
	const property valoracion = 20
}

object panMasaMadre{
	const property valoracion = 45
}