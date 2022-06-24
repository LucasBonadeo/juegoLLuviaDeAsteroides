import wollok.game.*

class Visual {
	var property image
	var property position = game.origin()
}

// Imagenes Asteroides grandes y medianos

const imagenesAsteroidesGrandes = ["asteroideAmarillo.png", "asteroideAzul.png", "asteroideCeleste.png", "asteroideRojo.png", 
		"asteroideRosa.png", "asteroideAmarillo - copia.png", "asteroideAzul - copia.png", "asteroideCeleste - copia.png", "asteroideRojo - copia.png", 
		"asteroideRosa - copia.png" ]
		
// Imagenes Asteroides chicos
		
const imagenesAsteroidesChicos = ["asteroideAmarillo1.png", "asteroideAzul1.png", "asteroideCeleste1.png", "asteroideRojo1.png", 
		"asteroideRosa1.png", "asteroideAmarillo1 - copia.png", "asteroideAzul1 - copia.png", "asteroideCeleste1 - copia.png", "asteroideRojo1 - copia.png", 
		"asteroideRosa1 - copia.png" ]

// Astronautas menu

const astronautas = ["AstronautaMenu1.png", "AstronautaMenu2.png", "AstronautaMenu3.png", "AstronautaMenu4.png",
		"AstronautaMenu5.png", "AstronautaMenu6.png", "AstronautaMenu7.png"]

// Piedras menu

const imgPiedrasMenu = ["piedrasMenu2.png", "piedrasMenu3.png", "piedrasMenu1.png", "piedrasMenu3.png"]

const mute = new Visual(image="mute.png", position=game.at(1,1))
const fondoEspacio = new Visual(image="wp9247430.jpg", position=game.at(0,0))
const fondoMenu = new Visual(image="fondoMenu.jpg", position=game.at(0,0))
const fondoAsteroide = new Visual(image="fondoAsteroides.png", position=game.at(0,0))

const puntuacionAstronauta = new Visual(image="astronautaPuntuacion.png" ,position=game.at(0, game.height() - 2 ))

// Musica

const musicaInicio = new Sound(file="__-___ ____ _ Super Nintendo  Sega Genesis 80s RetroWave Mix (mp3cut.net).mp3")