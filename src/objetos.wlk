import wollok.game.*
import visuales.*

object laser {
	var property position =nave.position()
	const property image = "laserChicoFinal.png"
	
	method disparar() {
		game.onTick(50, "disparar",{ self.mover() })
	}
	
	method mover() {
		position = position.up(1)
		if (position.y() == 25) { 
			position = nave.position()
			game.removeTickEvent("disparar")
		}
	}
}

object nave {
	var property position = game.at(7,1)
	var property image = "naveBase.png"
	var property modoCombate = false
	
	method activarModoCombate() {
		if (not modoCombate) {
			modoCombate = true
			image = "naveCombate.png"
		}
	}
	method disparar() { 
		if (modoCombate) {
			laser.disparar()
		}
	}
}

class Asteroide {
	var property position 
	const property image 
	const property velocidades = [600, 400, 200]
	
	method iniciarMovimiento(unaVelocidad) {
		game.onTick(unaVelocidad,"mover asteroide",{ self.mover() })
	}
	
	method mover() {
		position = position.down(1)
		if (position.y() == -4) { game.removeVisual(self) }
	}
}

const izquierda = game.at(20,3.randomUpTo(10))
const derecha = game.at(-15, 3.randomUpTo(10))

class ObjetoVivoEnMenu {
	const listaDeImg
	var property position 
	var property image = listaDeImg.first()
	const velocidad = [600, 800, 1000]
	
	method iniciar() {
		if (position==izquierda)
			game.onTick(velocidad.anyOne(),"mover izquierda",{ self.moverIzquierda() })
		else	
			game.onTick(velocidad.anyOne(),"mover derecha",{ self.moverDerecha() })
	}
	method moverIzquierda() {
		position = position.left(1)
		if (position.x() == -15) { 
			image = listaDeImg.anyOne()
			position = game.at(20,(2..20).anyOne())
		}
	}
	method moverDerecha() {
		position = position.right(1)
		if (position.x() == 20) { 
			image = listaDeImg.anyOne()
			position = game.at(-15,(2..20).anyOne())
		}
	}
}

const astronautaMenu1 = new ObjetoVivoEnMenu(listaDeImg=astronautas, position=izquierda)
const astronautaMenu2 = new ObjetoVivoEnMenu(listaDeImg=astronautas, image=astronautas.anyOne(), position=derecha)
const piedrasMenu1 = new ObjetoVivoEnMenu(listaDeImg=imgPiedrasMenu, position=derecha)

