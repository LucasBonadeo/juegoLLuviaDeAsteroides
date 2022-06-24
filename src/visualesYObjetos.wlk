import wollok.game.*

class Visual {
	var property image
	var property position = game.origin()
}

const mute = new Visual(image="mute.png", position=game.at(1,1))
const fondoEspacio = new Visual(image="wp9247430.jpg", position=game.at(0,0))
const fondoMenu = new Visual(image="fondoMenu.jpg", position=game.at(0,0))
const fondoAsteroide = new Visual(image="fondoAsteroides.png", position=game.at(0,0))

const puntuacionAstronauta = new Visual(image="astronautaPuntuacion.png" ,position=game.at(0, game.height() - 2 ))

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

object astronautaMenu {
	var property position = game.at(12,8)
	const property image = "AstronautaMenu.png"
	
	method iniciar() {
		game.onTick(150,"mover astronauta",{ self.mover() })
	}
	
	method mover() {
		position = position.left(1)
		if (position.x() == -8) { position = game.at(12,8) }
	}
}

// Musica

const musicaInicio = new Sound(file="__-___ ____ _ Super Nintendo  Sega Genesis 80s RetroWave Mix (mp3cut.net).mp3")