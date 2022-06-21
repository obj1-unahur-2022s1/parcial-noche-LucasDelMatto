import comidas.*
import comensales.*

object cocina{
	var property comidasParrilla = []
	
	method comidasVegetarianas() = comidasParrilla.filter({ c => c.aptoVegano() })
	
	method comidasCanivoras() = comidasParrilla.filter({ c => not c.aptoVegano() })
	
	method buenaOfertaVegetariana() = self.comidasCanivoras().size() - self.comidasVegetarianas().size() <= 2
	
	method platoFuerteCarnivoro() = self.comidasCanivoras().max({ c => c.valoracion() })
	
	method comidasQueAgradan(comensal) = comidasParrilla.filter({ c => comensal.leAgrada(c) })
	
	method servir(comida) = comidasParrilla.remove(comida)
	
	method platoRandom() = comidasParrilla.anyOne()
	
	method probarPlatoRandom(comensal) {
		const plato = self.platoRandom()
		
		if (comensal.leAgrada(plato)){
			self.servir(plato)
			comensal.comer(plato)
		}else{
			self.error('Al comensal no le agrada el plato')
		}
	}
	
	
}