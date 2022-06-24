import wollok.game.*
import visualesYObjetos.*

object partida {
	const imagenesAsteroides = ["asteroideAmarillo.png", "asteroideAzul.png", "asteroideCeleste.png", "asteroideRojo.png", "asteroideRosa.png" ]
	const  mp3 = musicaInicio
	
	method iniciar() {
		game.title("Naves Espaciales")
		game.width(16)
		game.height(20)
		game.cellSize(50)
		game.addVisual(fondoMenu)
		game.addVisual(astronautaMenu)
		astronautaMenu.iniciar()
		self.musica()
		keyboard.space().onPressDo { self.jugar() }
	}

	method musica() {
				
		keyboard.m().onPressDo { 
			mp3.play()
			mp3.volume(0.5) 
		}
			
		keyboard.n().onPressDo {
			if (mp3.paused()) { 
				mp3.resume()
				game.removeVisual(mute)
			} 
			else { 
				mp3.pause()
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
		keyboard.z().onPressDo { 
			nave.activarModoCombate()
		}
		keyboard.x().onPressDo { nave.disparar() }
		
		game.onTick(5000, "Crear Asteroide", { 
			const asteroide = new Asteroide(position=game.at(0,25),	image=imagenesAsteroides.anyOne())
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(10000, "Crear Asteroide", { 
			const asteroide = new Asteroide(position=game.at(2,25),	image=imagenesAsteroides.anyOne())
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(15000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(4,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(20000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(6,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(25000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(8,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(30000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(10,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(35000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(12,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		
		game.onTick(40000, "Crear Asteroide", { 
			const asteroide = new Asteroide(
				position=game.at(14,25),
				image=imagenesAsteroides.anyOne()
			)
			game.addVisual(asteroide)
			asteroide.iniciarMovimiento(asteroide.velocidades().anyOne())
		})
		game.addVisual(puntuacionAstronauta)
	//	game.whenCollideDo(laser, { elemento =>  game.removeVisual(elemento)
    	//	laser.position(nave.position())
  
	
	}
}

	
