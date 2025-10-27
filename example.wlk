class Nave {
  var combustible = 0
  var velocidad = 0
  var direccionRespectoAlSol = 0
  method acelerar(num) {
    velocidad = (velocidad + num).max(0).min(100000)
  }
  method superAcelerar(cuanto){ // extra
  if(cuanto.between(0, 50000) ){self.acelerar(cuanto*2)}
  else{
    throw new Exception(message="El valor debe estar entre el 0 y el 50000")}
  }
  method desacelerar(num){
    velocidad = (velocidad - num).max(0).min(100000)
  }
  method irHaciaElSol(){
    direccionRespectoAlSol = 10
  }
  method escaparDelSol(){
    direccionRespectoAlSol = -10
  }
  method ponerseParaleloAlSol(){
    direccionRespectoAlSol = 0
  }
  method acercarseUnPocoAlSol(){
    direccionRespectoAlSol = (direccionRespectoAlSol + 1).min(10)
  }
  method alejarseUnPocoAlSol(){
    direccionRespectoAlSol = (direccionRespectoAlSol - 1).max(-10)
  }
  method agregarCombustible(num) {
    combustible = combustible + num
  }
  method descargarCombustible(num) {
    combustible = (combustible - num).max(0)
  }
  method prepararViaje(){
    self.agregarCombustible(30000)
    self.acelerar(5000)
  }
}

class NaveBaliza inherits Nave {
  var color
  method cambiarColorDeBaliza(colorNuevo) {
    color = colorNuevo
  }
  method color() {
    return color
  }
  override method prepararViaje(){
  super()
  self.cambiarColorDeBaliza("verde")
  self.ponerseParaleloAlSol()
  }
}

class NavePasajeros inherits Nave{
const property pasajeros
var racionesComida = 0
var racionesBebida = 0

method cargarRacionesDeComida(num) {
  racionesComida = racionesComida + num
}
method descargarRacionesDeComida(num){
  racionesComida = racionesComida - num.max(0)
}
method comida() {
  return racionesComida
}
method cargarRacionesDeBebida(num) {
  racionesBebida = racionesBebida + num
}
method descargarRacionesDeBebida(num){
  racionesBebida = (racionesBebida - num).max(0)
}
method bebida(){
  return racionesBebida
}
override method prepararViaje() {
  super()
  racionesComida = pasajeros*4
  racionesBebida = pasajeros*6
  self.acercarseUnPocoAlSol()
}
}

class NaveCombate inherits Nave{
var invisible
var misiles
const property mensajesEmitidos = []
method ponerseVisible() {
  invisible = false
}
method ponerseInvisible(){
  invisible = true
}
method estaInvisible(){
  return invisible
}
method desplegarMisiles() {
  misiles = true
}
method replegarMisiles(){
  misiles = false
}
method misilesDesplegados(){
  return misiles
}
method emitirMensaje(mensaje){
mensajesEmitidos.add(mensaje)
}
method primerMensajesEmitido(){
  return mensajesEmitidos.first()
}
method ultimoMensajeEmitido(){
  return mensajesEmitidos.last()
}
method esEscueta(){
  return not mensajesEmitidos.any({mensaje => mensaje.lenght() > 30})
}
method emitioMensaje(mensaje){
  return mensajesEmitidos.contains(mensaje)
}

override method prepararViaje() {
  super()
  self.ponerseVisible()
  self.replegarMisiles()
  self.acelerar(15000)
  self.emitirMensaje("Saliendo en misión")
}
}