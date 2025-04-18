import cosas.* 

object casaDePepeYJulian {
    
	
	const property cosasCompradas = []
	var property gastadoEnCompras = 0
	var property cuentaAsignada = cuentaCorriente

	method comprar(cosa) {
		cosasCompradas.add(cosa)
		gastadoEnCompras += cosa.precio()
		cuentaAsignada.extraer(cosa.precio())

	}
	method cantidadDeCosasCompradas() {
		return cosasCompradas.size()
	}

	method tieneAlgun(categoria) {
		return cosasCompradas.any({ cosa => cosa.categoria() == categoria })

	}

	method vieneDeComprar(categoria) {
		return ((cosasCompradas.last().categoria()) == categoria)

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
		return cosasCompradas.map({ cosa => cosa.categoria() }).distinct()

	}

}

object cuentaCorriente {
	var saldo = 0 //duda aca de si usar var property. por las dudas, dejo var

	method saldo() {
		return saldo
	}

	method saldo(_saldo) {
		saldo = _saldo
	}

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
	var saldo= 0 //duda de si usar var property aca esta ok. por el metodo de depositar
	
	var costoPorOperacion = 0

	method saldo() {
		return saldo
	}

	method saldo(_saldo) {
		saldo = _saldo
	}

	method costoPorOperacion(){
		return costoPorOperacion
	}

	method costoPorOperacion(_costo) {
		costoPorOperacion = _costo
	}

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
