import wollok.game.*
import objetos.*
import visuales.*

object partida {
	const dificultades = [dificultad.facil(), dificultad.medio(), dificultad.dificil()]
	
	method iniciar() {
		game.title("Naves Espaciales")
		game.width(16)
		game.height(20)
		game.cellSize(50)
		game.addVisual(fondoMenu)
		self.moverRocasMenu()
		game.addVisual(astronautaMenu)
		self.musica()
		keyboard.space().onPressDo { self.jugar() }
	}

	method moverRocasMenu() {
		game.addVisual(rocaIzquierda)
		game.addVisual(rocaDerecha)
		rocaIzquierda.iniciar()
		rocaDerecha.iniciar()
	}
	
	method musica() {
		keyboard.m().onPressDo { 
			musicaInicio.play()
			musicaInicio.volume(0.5) 
		}
		keyboard.n().onPressDo {
			if (musicaInicio.paused()) { 
				musicaInicio.resume()
				game.removeVisual(mute)
			} 
			else { 
				musicaInicio.pause()
				game.addVisual(mute)
			}
		}
	}
	method jugar() {
		game.clear()
		game.addVisual(fondoEspacio)
		game.addVisual(fondoAsteroide)
		game.addVisualCharacter(laser)
		game.addVisualCharacter(nave)
		keyboard.z().onPressDo { nave.activarModoCombate() }
		keyboard.x().onPressDo { nave.disparar() }
		
		game.onTick(dificultades.get(1), "Crear Asteroide grande/mediano", { 
			const asteroide = new Asteroide(position=game.at(0.randomUpTo(16),25),image=imagenesAsteroidesGrandes.anyOne())
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(dificultades.get(1), "Crear Asteroide chico", { 
			const asteroide = new Asteroide(position=game.at(0.randomUpTo(16),25),image=imagenesAsteroidesChicos.anyOne())
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		game.whenCollideDo(nave,{elemento=>if(elemento!=laser)elemento.metodosChoques()})
		game.whenCollideDo(laser,{elemento=>if(elemento!=nave)elemento.metodosChoques()})
		
 }
}

object dificultad {
	method facil() = 8000
	method medio() = 5000
	method dificil() = 3000
}