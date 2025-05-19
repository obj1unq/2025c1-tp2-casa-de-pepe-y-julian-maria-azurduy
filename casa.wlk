import cosas.* 

object casaDePepeYJulian {
    
	
	const property cosasCompradas = []
	var property gastadoEnCompras = 0
	var property cuentaAsignada = cuentaCorriente

	method gastos(){
		return self.preciosCompras() 
		

	}

	method preciosCompras() {
		return cosasCompradas.sum({cosa => cosa.precio(self)})
	}


	method comprar(cosa) {
		cuentaAsignada.extraer(cosa.precio())
		cosasCompradas.add(cosa)
	}

	method cantidadDeCosasCompradas() {
		return cosasCompradas.size()
	}

	method tieneAlgun(categoria) {
		return cosasCompradas.any({ cosa => cosa.categoria() == categoria })

	}

	method vieneDeComprar(categoria) {
		return cosasCompradas.last().categoria() == categoria

	}

	method esDerrochona(){
		return (gastadoEnCompras > 9000)

	}

	method compraMasCara() {
		return cosasCompradas.max({
            cosa => cosa.precio()
        })

	}

	method comprados(categoria){
		return cosasCompradas.filter( { cosa =>  
            cosa.categoria() == categoria
        } )

	}

	method malaEpoca() {
		return cosasCompradas.all({ cosa => cosa.categoria() == comida }) 

	}

	method queFaltaComprar(lista) {
		return lista.filter({ cosa => !cosasCompradas.contains(cosa) }) 
	}

	method faltaComida() {
		return cosasCompradas.count({ cosa => cosa.categoria() == comida } < 2)

	}

	method categoriasCompradas() {
		return cosasCompradas.map({ cosa => cosa.categoria() }).asSet()

	}

}

object cuentaCorriente {
	var property saldo = 0 

	method depositar(monto) {
		saldo += monto
	}

	method extraer(monto) {
		self.validarExtraer(monto)
		saldo -= monto
	}


  method validarExtraer(monto) {
    if (saldo < monto) {
      self.error("No puede retirar!")
    }
  }

}

object cuentaConGastos {
	var property saldo= 0 
	
	var property costoPorOperacion = 0

	method depositar(monto) {
		self.validarDepositar(monto)
		saldo += monto - costoPorOperacion
	}
	method validarDepositar(monto){
		if (monto > 1000){
			self.error("No puede depositar monto mayor a mil")
		}
	}

	method extraer(monto) {
		saldo -= monto
	}

}
