Algoritmo transferencia_automatica
	Definir rele5_reset Como Logico
	Definir rele4_stop Como Logico
	Definir rele3_contactor_gen Como Logico
	Definir rele2_contactor_ande Como Logico
	Definir rele1_start_gen Como Logico
	Definir cont_ande Como Entero
	Definir cont_gen Como Entero
	Definir tiempo_de_arranque Como Entero
	cont_ande <- 1
	cont_gen <- 1
	pulsador_start <- Falso
	repite <- Verdadero
	tiempo_de_arranque <- 3
	energia_gen <- Falso
	// Entramos en el bucle infinito
	Repetir
		Escribir 'Tenemos Señal de Red Electrica?'
		Leer energia_red
		// Mientras haya energia en red
		Mientras energia_red Hacer
			Si cont_ande==1 Entonces
				rele5_reset <- Falso
				Escribir 'Se desactiva rele de activo de combustible'
				rele4_stop <- Verdadero
				Escribir 'Se desactiva rele de stop del generador'
				rele3_contactor_gen <- Falso
				Escribir 'Se desactiva relé del contactor Generador'
				rele1_start_gen <- Falso
				Escribir 'Se desactiva inicio de generador'
				Escribir 'Retraso 3 segundos'
				rele2_contactor_ande <- Verdadero
				Escribir 'Se activo contactor Ande'
				Escribir 'Retraso 3 segundos'
				rele5_reset <- Verdadero
				Escribir 'Se activo rele de activo de combustible'
			FinSi
			Escribir 'Tenemos Señal de Red Electrica?'
			Leer energia_red
			cont_ande <- cont_ande+1
		FinMientras
		Si !energia_red Entonces
			Repetir
				Si !energia_gen Entonces
					Escribir 'Se Inicia Generador?'
					Leer pulsador_start
					Escribir 'Tiempo de Arranque:'
					Leer tiempo_de_arranque
					Si pulsador_start Entonces
						Si cont_gen==1 Entonces
							cont_ande <- 1
							rele2_contactor_ande <- Falso
							Escribir 'Se desactiva contactor Ande'
							rele4_stop <- Verdadero
							Escribir 'Se desactiva salida de Rele de stop del generador'
							Escribir 'Retraso 3 segundos'
							rele3_contactor_gen <- Verdadero
							Escribir 'Se sactiva relé de Generador'
							rele1_start_gen <- Verdadero
							Escribir 'Se activa inicio de generador'
							rele1_start_gen <- Verdadero
							Escribir 'El tiempo de arranque es ',tiempo_de_arranque
							pulsador_start <- Falso
							rele1_start_gen <- Falso
							Escribir 'Arranco Generador?'
							Leer energia_gen
						FinSi
					FinSi
				SiNo
					Escribir 'El generador esta en marcha'
				FinSi
			Hasta Que energia_gen
			Escribir 'Ahora arranco generador!!'
			cont_gen <- cont_gen+1
		FinSi
	Hasta Que !repite
FinAlgoritmo
