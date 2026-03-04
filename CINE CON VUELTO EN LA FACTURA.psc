Algoritmo CINE
	
	Definir auxiliarvalidacion Como Caracter
	
	Definir metodoPago Como Caracter
	Definir montoPagadoBs, montoPagadoDolares Como Real
	Definir pagoCompletado Como Logico
	
	Definir NombreUsuario Como Caracter
    Definir pedirNombre Como Logico
    pedirNombre = Verdadero  // Variable de tipo booleano para controlar cuándo pedir el nombre
	
	
	
	Definir op, op2, op3, op4 Como Entero //Variables para guardar la opcion seleccionada en cada menu
	Definir bool Como Logico //Variable para mostrar el siguiente menu luego de la descripcion de una pelicula
	Definir horario Como Entero //Variable para saber que horario mostrar segun la pelicula elegida
	Definir MenuPrincipal, MenuCartelera Como Logico //Variable para romper los bucles y poder regresar a los menu
	Definir PaFact Como Caracter //Variable para poder mostrar resumen de la funcion en la factura
	Definir FuncionActual Como Entero //Variable para saber que funcion eligio el usuario
	// Inicializar variables de conteo
	Definir totalNiños, totalAdultos, totalAdultosMayores Como Entero //Variables para contabilizar la cantidad de entradas segun A,N,T
	Definir montoNiños, montoAdultos, montoAdultosMayores, montoTotal Como Real //Variables para contabilizar la cantidad de entradas segun A,N,T en dinero
	Definir respuestaFinal,respuestaDulceria Como Entero //Variables de opcion en menus
	
	//Variables de tipo booleano para determinar que se va a mostrar en la factura si solo asientos, solo dulceria o ambas
	Definir comproEntradas, comproDulceria Como Logico
	comproEntradas = Falso
	comproDulceria = Falso
	
	
	// Arreglo con nombres de peliculas
	Dimension NombresPeliculas[4]
	NombresPeliculas[1] = "UNA PELICULA DE MINECRAFT"
	NombresPeliculas[2] = "THUNDERBOLTS (NUEVOS AVENGERS)"
	NombresPeliculas[3] = "DESTINO FINAL LAZOS DE SANGRE"
	NombresPeliculas[4] = "LILO Y STICH (LIVE ACTION)"
	
	//Matriz donde se guardan las salas asignadas a cada pelicula
	Dimension SalasAsignadas[4,2] 
	
	
	// Película 1 (Minecraft)
	SalasAsignadas[1,1] = 1
	SalasAsignadas[1,2] = 2
	
	// Pelicula 2 (Thunderbolts)
	SalasAsignadas[2,1] = 3
	SalasAsignadas[2,2] = 4
	
	// Pelicula 3 (Destino Final)
	SalasAsignadas[3,1] = 5
	SalasAsignadas[3,2] = 6
	
	// Pelicula 4 (Lilo y Stitch)
	SalasAsignadas[4,1] = 7
	SalasAsignadas[4,2] = 8
	
	
	// Declaración de la matriz de salas
	Dimension Salas[4,2,16,10] //4 peliculas, 2 funciones por pelicula, Salas de 16 filas y 10 columnas
	InicializarSalas(Salas) // Subproceso para inicializar las salas 
	AsignarAsientosFueraDeServicio(Salas) //  Subproceso para establecer 3 asientos como fuera de servicio aleatoriamente 
	LlenarAsientosAleatoriamente(Salas) //  Subproceso para establecer el 60% de asientos llenos aleatoriamente
	
	// Variables para precios de entradas
    Definir Precio_Niño Como Real
    Precio_Niño = 1.00
    
    Definir Precio_Adulto Como Real
    Precio_Adulto = 2.00
    
    Definir Precio_Adulto_Mayor Como Real
    Precio_Adulto_Mayor = 3.00
	
	Repetir
		
		respuestaFinal=0
		//Incializar variables para el conteo de asientos
		totalNiños = 0
		totalAdultos = 0
		totalAdultosMayores = 0
		montoNiños = 0
		montoAdultos = 0
		montoAdultosMayores = 0
		
		MenuPrincipal = Verdadero //Variable de tipo booleano para movilizarce entre los menus
		
		// Solicitar nombre solo cuando sea necesario
		Si pedirNombre Entonces
			Repetir
				Limpiar Pantalla
				Escribir "          ==========================================================="
				Escribir "                            BIENVENIDO A GESD FILMS                  "
				Escribir "          ==========================================================="
				Escribir ""
				Escribir "Ingresa tu nombre por favor (solo letras y espacios): "
				Leer NombreUsuario
				
				//VALIDACION PARA EVITAR QUE EL NOMBRE CONTENGA NUMEROS O ESTE VACIO
				
				// Eliminar espacios en blanco al inicio y al final manualmente
				Mientras Longitud(NombreUsuario) > 0 Y Subcadena(NombreUsuario, 1, 1) = " " Hacer
					NombreUsuario = Subcadena(NombreUsuario, 2, Longitud(NombreUsuario))
				FinMientras
				
				Mientras Longitud(NombreUsuario) > 0 Y Subcadena(NombreUsuario, Longitud(NombreUsuario), Longitud(NombreUsuario)) = " " Hacer
					NombreUsuario = Subcadena(NombreUsuario, 1, Longitud(NombreUsuario) - 1)
				FinMientras
				
				nombreValido = Verdadero
				
				// Validar que el nombre no esté vacío después de quitar espacios
				Si Longitud(NombreUsuario) = 0 Entonces
					nombreValido = Falso
				Sino
					// Verificar cada caracter
					Para i_nombre = 1 Hasta Longitud(NombreUsuario) Hacer
						caracter = Mayusculas(Subcadena(NombreUsuario, i_nombre, i_nombre))
						
						// Verificar si es letra (A-Z) o espacio
						Si (caracter < "A" O caracter > "Z") Y caracter <> " " Entonces
							nombreValido = Falso
						FinSi
					FinPara
				FinSi
				
				Si NO nombreValido Entonces
					Escribir "Error! El nombre solo puede contener letras y espacios."
					Escribir "Ejemplo válido: Juan Perez"
					Esperar 2 Segundos
				FinSi
			Hasta Que nombreValido
			
			pedirNombre = Falso  // Ya no pedir el nombre hasta nueva factura
		FinSi
		
		
		
		
		Repetir
			Repetir
				Limpiar Pantalla
				Escribir "          ==========================================================="
				Escribir "                            BIENVENIDO A GESD FILMS                  "
				Escribir "          ==========================================================="
				Escribir ""
				Escribir ""
				Escribir "    ================ MENU PRINCIPAL ================"
				Escribir ""
				Escribir "    1. Cartelera"
				Escribir "    2. Dulceria"
				Escribir "    3. Salir"
				Escribir "    Opcion: "
				Leer auxiliarvalidacion
				//Validacion para evitar la entrada de letras y caracteres especiales
				Si NO EsNumero(auxiliarvalidacion) Entonces
					Escribir "Debe ingresar un número!"
					Esperar 2 segundos
				FinSi
			Hasta Que EsNumero(auxiliarvalidacion)
			
			op = ConvertirANumero(auxiliarvalidacion)
			//Validacion para evitar las entrada invalidas
			Si op < 1 O op > 3 Entonces
				Escribir "      Recuerde seleccionar una opcion valida entre 1 y 3."
				Esperar 2 Segundos
			fin si
			
		Hasta Que op >= 1 Y op <= 3
		
		
		
		
		
		Segun op Hacer
			
			1: 
				//OPCION 1 DEL MENU PRINCIPAL: MOSTRAMOS LA CARTELERA DISPONIBLE PARA EL MES DE MAYO
				Repetir
					
					
					
					
					Repetir
						Repetir
							Limpiar Pantalla
							MenuCartelera = Verdadero //Variable de tipo booleano para movilizarce entre los menus
							bool = Falso //Se usa para indicar si se selecciona una pelicula valida
							Escribir "            #############################################################"
							Escribir "            #                                                           #"
							Escribir "            #               CARTELERA PARA EL MES DE MAYO               #"
							Escribir "            #                                                           #"
							Escribir "            #############################################################"
							Escribir ""
							Escribir "    =========================================="
							Escribir "    1. ",NombresPeliculas[1]
							Escribir "    =========================================="
							Escribir "    2. ",NombresPeliculas[2]
							Escribir "    =========================================="
							Escribir "    3. ",NombresPeliculas[3]
							Escribir "    =========================================="
							Escribir "    4. ",NombresPeliculas[4]
							Escribir "    =========================================="
							Escribir "    Opcion: "
							Leer auxiliarvalidacion
							
							//Validacion para evitar la entrada de letras y caracteres especiales
							Si NO EsNumero(auxiliarvalidacion) Entonces
								Escribir "      Debe ingresar un número!"
								Esperar 2 segundos
							FinSi
						Hasta Que EsNumero(auxiliarvalidacion)
						
						op2 = ConvertirANumero(auxiliarvalidacion)
						//Validacion para evitar las entrada invalidas
						Si op2 < 1 O op2 > 4 Entonces
							Escribir "      Recuerde seleccionar una opcion valida entre 1 y 4."
							Esperar 2 Segundos
						Fin si
						
					Hasta Que op2 >= 1 Y op2 <= 4
					
					//LLAMAMOS A LA FUNCION PARA MOSTRAR LA DESCRIPCION DE LAS PELICULAS
					DescripcionPelicula(op2, horario)
					bool = Verdadero
					pelicula <- op2
					
					Si bool = Verdadero Entonces // Si se mostró la descripción de una pelicula entonces mostramos el siguiente menu
						
						Repetir
							
							
							
							Repetir
								Repetir
									Limpiar Pantalla
									DescripcionPelicula(op2, horario)
									//Menu de interaccion para el usuario 
									Escribir ""
									Escribir "      ¿Que desea hacer ahora?"
									Escribir "      1. Volver al Menú Principal"
									Escribir "      2. Volver a la Cartelera"
									Escribir "      3. Ver horarios"
									Escribir "    Opcion: "
									Leer auxiliarvalidacion
									
									Si NO EsNumero(auxiliarvalidacion) Entonces
										Escribir "      Debe ingresar un número!"
										Esperar 2 segundos
									FinSi
									
								Hasta Que EsNumero(auxiliarvalidacion)
								
								op3 = ConvertirANumero(auxiliarvalidacion)
								
								Si op3 < 1 O op3 > 3 Entonces
									Escribir ""
									Escribir "      Opción inválida. Elija entre 1 y 3."
									Esperar 2 Segundos
									Limpiar Pantalla     
									DescripcionPelicula(op2, horario)  //LLamamos de nuevo al SubProceso para mostrar la sinopsis sin el mensaje de opcion invalida
								FinSi
							Hasta Que op3 >= 1 Y op3 <= 3
							
							
							
							
							
							
							Segun op3 Hacer
								
								1:
									//OPCION 1 DE OP3: VOLVER AL MENU PRINCIPAL
									MenuPrincipal = Falso //Cambiamos el valor de la variable booleana para salir del ciclo principal
									
								2:
									//OPCION 2 DE OP3: VOLVER AL MENU DE LA CARTELERA
									MenuCartelera = Falso//Cambiamos el valor de la variable booleana para salir del ciclo de cartelera
									
								3:
									
									
									
									//OPCION 3 DE OP3: MOSTRAR AL USUARIO LOS HORARIOS DE LA PELICULA QUE SELECCIONO
									Repetir
										Repetir
											Repetir
												Limpiar Pantalla
												MostrarHorarios(horario) //Hacemos la llamada al SubProceso para mostrar los horarios
												
												//Menu de interaccion para el usuario 
												Escribir ""
												Escribir "¿Que desea hacer ahora?"
												Escribir "1. Elegir función"
												Escribir "2. Volver a la Cartelera"
												Escribir "    Opcion: "
												
												Leer auxiliarvalidacion
												Si NO EsNumero(auxiliarvalidacion) Entonces
													Escribir "      Debe ingresar un número!"
													Esperar 2 segundos
												FinSi
											Hasta Que EsNumero(auxiliarvalidacion)
											
											op4 = ConvertirANumero(auxiliarvalidacion)
											
											si op4 <1 o op4>2
												
												Escribir ""
												Escribir "Entrada invalida seleccione entre 1 y 2"
												Esperar 2 Segundos
												
											FinSi
											
										Hasta Que op4 >= 1 Y op4 <= 2
										
									Hasta Que op4 >= 1 y op4 <= 2
									
									
									Segun op4 Hacer
										
										1:
											//OPCION 1 DE OP4: EL USUARIO PUEDE ELEGIR LA FUNCION QUE DESEE
											Repetir
												Repetir
													Repetir
														Limpiar Pantalla
														MostrarHorarios(horario)
														Escribir ""
														Escribir "Escoja una función 1/2: "
														Leer auxiliarvalidacion
														
														Si NO EsNumero(auxiliarvalidacion) Entonces
															Escribir "      Debe ingresar un número!"
															Esperar 2 segundos
														FinSi
														
													Hasta Que EsNumero(auxiliarvalidacion)
													
													FuncionActual = ConvertirANumero(auxiliarvalidacion)
													
													si FuncionActual <1 o FuncionActual>2
														
														Escribir ""
														Escribir "Entrada invalida seleccione entre 1 y 2"
														Esperar 2 Segundos
														
													FinSi
													
												Hasta Que FuncionActual >= 1 Y FuncionActual <= 2
												
											Hasta Que FuncionActual >=1 y FuncionActual<=2
											
											
											
											// Validación de edad
											Repetir
												Repetir
													Repetir
														Limpiar Pantalla
														Escribir "========================================"
														Escribir "          VERIFICACIÓN DE EDAD          "
														Escribir "========================================"
														Escribir ""
														Escribir "Por favor ingrese su edad: "
														Leer auxiliarvalidacion
														
														Si NO EsNumero(auxiliarvalidacion) Entonces
															Escribir "      Debe ingresar un número!"
															Esperar 2 segundos
														FinSi
														
													Hasta Que EsNumero(auxiliarvalidacion)
													
													EdadUsuario = ConvertirANumero(auxiliarvalidacion)
													
													si EdadUsuario <= 14 Entonces
														Escribir ""
														Escribir "Debes ser mayor de 14 años o estar acompañado de un adulto para comprar boletos"
														Esperar 2.5 Segundos
													FinSi
													si EdadUsuario >= 100 Entonces
														Escribir "Estas muy jovensito pa"
														Esperar 2 segundos
													FinSi
													
												Hasta Que EdadUsuario >= 14 Y EdadUsuario <= 100
											Hasta Que EdadUsuario >= 14 y EdadUsuario <= 100
											
											
											
											//ESTE SEGUN ES SOLO PARA PODER MOSTRAR UN RESUMEN DE LA FUNCION EN LA FACTURA
											Segun horario Hacer
												1:
													
													Si FuncionActual = 1 Entonces
														
														PaFact <- "MINECRAFT - Martes 20 de mayo - SALA 1 --> 2:30 PM"
													SiNo
														
														PaFact <- "MINECRAFT - Martes 20 de mayo - SALA 2 --> 4:15 PM"
													FinSi
												2:
													
													Si FuncionActual = 1 Entonces
														PaFact <- "THUNDERBOLTS - Domingo 18 de mayo - SALA 3 --> 3:00 PM"
													SiNo
														PaFact <- "THUNDERBOLTS - Lunes 19 de mayo - SALA 4 --> 1:00 PM"
													FinSi
													
													
												3:
													
													Si FuncionActual = 1 Entonces
														PaFact <- "DESTINO FINAL - Miércoles 21 de mayo - SALA 5 --> 5:00 PM"
													SiNo
														PaFact <- "DESTINO FINAL - Jueves 22 de mayo - SALA 6 --> 9:30 PM"
													FinSi
													
												4:
													Si FuncionActual = 1 Entonces
														PaFact <- "LILO Y STICH - Viernes 23 de mayo - SALA 7 - 2:45 PM"
													SiNo
														PaFact <- "LILO Y STICH - Sábado 24 de mayo - SALA 8 - 4:15 PM"
													FinSi
													
											FinSegun
											
											
											
											//SUBPROCESOS INTERNOS QUE SE REALIZAN EN ESTE MOMENTO:
											//Las salas son inicializadas con 0
											//Se asignan 3 asientos fuera de servicio aleatoriamente con X
											//Se pre-asigna el 60% de los asientos de la sala de manera aleatoria con A, N o T 
											
											//LUEGO DE VERIFICAR LA EDAD Y REALIZAR LOS SUBPROCREOS INTERNOS 
											//IMPRIMIMOS LA SALA SEGUN LA PELICULA Y LA FUNCION QUE ELIGIO EL USUARIO
											
											//Hacemos la llamada al SubProceso para mostrar la sala
											ImprimirSala(Salas, op2, FuncionActual,NombresPeliculas,SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
											
											//Hacemos la llamada al SubProceso para proceder con la reserva de asientos
											ReservarAsiento(Salas, op2, FuncionActual, NombresPeliculas, SalasAsignadas, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
											comproEntradas = Verdadero
											//Menu de interaccion para el usuario
											
											Repetir
												Repetir
													Repetir
														Limpiar Pantalla
														Escribir ""
														Escribir "      ¿Que desea hacer ahora?"
														Escribir "      1. Ir a la Dulceria (OFERTAS!)"
														Escribir "      2. Ir a metodos de pago"
														Escribir "      Opcion: "
														Leer auxiliarvalidacion
														
														Si NO EsNumero(auxiliarvalidacion) Entonces
															Escribir "      Debe ingresar un número!"
															Esperar 2 segundos
														FinSi
														
													Hasta Que EsNumero(auxiliarvalidacion)
													respuestaDulceria = ConvertirANumero(auxiliarvalidacion)
													
													si respuestaDulceria <1 o respuestaDulceria >2
														
														Escribir ""
														Escribir "Entrada invalida seleccione entre 1 y 2"
														Esperar 2 Segundos
														
													FinSi
													
												Hasta Que respuestaDulceria >= 1 Y respuestaDulceria <= 2
											Hasta Que respuestaDulceria >=1 y respuestaDulceria <=2
											
											
											
											Si respuestaDulceria = 1 Entonces
												
												//OPCION 1 respuestaDulceria: DIRIGIMOS AL USUARIO AL MENU DE DULCERIA
												MenuDulceria(NombreUsuario, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores, PaFact, comproEntradas, comproDulceria)//Hacemos la llamada al SubProceso para mostrar el menu de la dulceria
												
												//Menu para ealizar una nueva iteracion en el programa luego de mostrar una factura
												pedirNombre = Verdadero
												
												Repetir
													Repetir
														Limpiar Pantalla
														Escribir ""
														Escribir "      ¿Que desea hacer ahora?"
														Escribir "      1. Volver al menu Principal"
														Escribir "      2. Salir"
														Escribir "      Opcion: "	
														Leer auxiliarvalidacion
														
														Si NO EsNumero(auxiliarvalidacion) Entonces
															Escribir "      Debe ingresar un número!"
															Esperar 2 segundos
															
														FinSi
													Hasta Que EsNumero(auxiliarvalidacion)
													
													respuestaFinal = ConvertirANumero(auxiliarvalidacion)
													
													si respuestaFinal <1 o respuestaFinal > 2 Entonces
														
														Escribir ""
														Escribir "Entrada invalida"
														Esperar 2 Segundos
														
													FinSi
													
												Hasta Que respuestaFinal >= 1 Y respuestaFinal <= 2
												
												
												Si respuestaFinal = 1 Entonces
													MenuPrincipal = Falso //Cambiamos el valor de la variable booleana para salir del ciclo principal
													pedirNombre = Verdadero
												SiNo
													MostraDespedida //Hacemos la llamada al SubProceso para mostrar la despedida
												FinSi
												
												
											SiNo
												//OPCION 2 respuestaDulceria: MOSTRAMOS AL USUARIO LOS METODOS DE PAGO
												FacturacionCompleta(NombreUsuario, PaFact, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores, "", 0, comproEntradas, Falso)
												
												//Menu para ealizar una nueva iteracion en el programa luego de mostrar una factura
												pedirNombre = Verdadero
												Repetir
													Repetir
														Limpiar Pantalla
														Escribir ""
														Escribir "      ¿Que desea hacer ahora?"
														Escribir "      1. Volver al menu Principal"
														Escribir "      2. Salir"
														Escribir "      Opcion: "	
														Leer auxiliarvalidacion
														
														Si NO EsNumero(auxiliarvalidacion) Entonces
															Escribir "      Debe ingresar un número!"
															Esperar 2 segundos
															
														FinSi
													Hasta Que EsNumero(auxiliarvalidacion)
													
													respuestaFinal = ConvertirANumero(auxiliarvalidacion)
													
													si respuestaFinal <1 o respuestaFinal > 2 Entonces
														
														Escribir ""
														Escribir "Entrada invalida"
														Esperar 2 Segundos
														
													FinSi
													
												Hasta Que respuestaFinal >= 1 Y respuestaFinal <= 2
												
												Si respuestaFinal = 1 Entonces
													MenuPrincipal = Falso //Cambiamos el valor de la variable booleana para salir del ciclo principal
													pedirNombre = Verdadero
												SiNo
													MostraDespedida //Hacemos la llamada al SubProceso para mostrar la despedida
												FinSi
												
											FinSi
											
										2:
											
											//OPCION 2 DE OP4: VOLVER AL MENU DE LA CARTELERA
											MenuCartelera = Falso //Cambiamos el valor de la variable booleana para salir del ciclo de cartelera
											
											
									FinSegun
							FinSegun
						Hasta Que op3 >= 1 Y op3 <= 3
					FinSi
				Hasta Que op2 >= 1 Y op2 <= 4 y MenuCartelera = Verdadero
				
			2:
				//OPCION 2 DEL MENU PRINCIPAL: MOSTRAMOS EL MENU DE LA DULCERIA
				MenuDulceria(NombreUsuario, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores, PaFact, comproEntradas, comproDulceria)//Hacemos la llamada al SubProceso para mostrar el menu de la dulceria
				
				//Menu para ealizar una nueva iteracion en el programa luego de mostrar una factura
				pedirNombre = Verdadero
				Repetir
					Repetir
						Limpiar Pantalla
						Escribir ""
						Escribir "      ¿Que desea hacer ahora?"
						Escribir "      1. Volver al menu Principal"
						Escribir "      2. Salir"
						Escribir "      Opcion: "	
						Leer auxiliarvalidacion
						
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
							
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					respuestaFinal = ConvertirANumero(auxiliarvalidacion)
					
					si respuestaFinal <1 o respuestaFinal > 2 Entonces
						
						Escribir ""
						Escribir "Entrada invalida"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que respuestaFinal >= 1 Y respuestaFinal <= 2
				
				Si respuestaFinal = 1 Entonces
					MenuPrincipal = Falso //Cambiamos el valor de la variable booleana para salir del ciclo principal
					pedirNombre = Verdadero
				SiNo
					MostraDespedida //Hacemos la llamada al SubProceso para mostrar la despedida
				FinSi
			3:
				//OPCION 3 DEL MENU PRINCIPAL: MOSTRAMOS UN MENSAJE DE DESPEDIDA PARA EL USUARIO
				
				MostraDespedida //Hacemos la llamada al SubProceso para mostrar la despedida
				
		FinSegun
	Hasta Que op >= 1 Y op <= 3 y MenuPrincipal = Verdadero
FinAlgoritmo



















//SUBPROCESO: MOSTRAMOS LA DESCRIPCION DE LA PELICULA SELECCIONADA POR EL USUARIO
SubProceso DescripcionPelicula (op2, horario Por Referencia)
	
	Limpiar Pantalla
	Segun op2 Hacer
		
		1: 
			Limpiar Pantalla
			Escribir "                    ###########################################################"
			Escribir "                    #                                                         #"
			Escribir "                    #                UNA PELICULA DE MINECRAFT                #"
			Escribir "                    #                                                         #"
			Escribir "                    ###########################################################"
			Escribir ""
			Escribir "    · Sinopsis: El malvado dragón de Ender está en su camino a la destrucción, haciendo que una chica joven y su grupo de aventureros amigos intenten salvar el Overworld."
			Escribir ""
			Escribir "    · Fecha de Estreno: 03-04-2025"
			Escribir "    · Director: Jared Hess"
			Escribir "    · Elenco: Jack Black, Jared Hess, Jason Momoa, Danielle Brook"
			Escribir "    · Censura: A"
			horario = 1 //Define que esta es la pelicula 1 sirve para el subproceso de mostrar los horarios
			
		2:
			
			Limpiar Pantalla
			Escribir "                              ##################################################################"
			Escribir "                              #                                                                #"
			Escribir "                              #                 THUNDERBOLTS (NUEVOS AVENGERS)                 #"
			Escribir "                              #                                                                #"
			Escribir "                              ##################################################################"
			Escribir ""
			Escribir "    · Sinopsis: Un grupo de supervillanos poco convencional es reclutado para hacer misiones para el gobierno Yelena Belova, Bucky Barnes, Red Guardian, Ghost, Taskmaster y John Walker. Después de verse atrapados en una trampa mortal urdida por Valentina Allegra de Fontaine, estos marginados deben embarcarse en una peligrosa misión que les obligará a enfrentarse a los recovecos más oscuros de su pasado."
			Escribir ""
			Escribir "    · Fecha de Estreno: 01-05-2025"
			Escribir "    · Director: Jake Schreier"
			Escribir "    · Elenco: Sebastian Stan, David Harbour, Jake Schreier, Florence Pugh"
			Escribir "    · Censura: A"
			horario = 2
			
		3:
			Limpiar Pantalla
			Escribir "                              #################################################################"
			Escribir "                              #                                                               #"
			Escribir "                              #                 DESTINO FINAL LAZOS DE SANGRE                 #"
			Escribir "                              #                                                               #"
			Escribir "                              #################################################################"
			Escribir ""
			Escribir "    · Sinopsis: Atormentada por una pesadilla violenta recurrente, una estudiante universitaria regresa a casa para encontrar a la única persona que puede romper el ciclo y salvar a su familia del horrible destino que inevitablemente les espera."
			Escribir ""
			Escribir "    · Fecha de Estreno: 15-05-2025"
			Escribir "    · Director: Zach Lipovsky y Adam Stein"
			Escribir "    · Elenco:  Zach Lipovsky, Kaitlyn Santa Juana, Teo Briones"
			Escribir "    · Censura: C"
			horario = 3
			
		4:
			Limpiar Pantalla
			Escribir "                              ##############################################################"
			Escribir "                              #                                                            #"
			Escribir "                              #                 LILO Y STICH (LIVE ACTION)                 #"
			Escribir "                              #                                                            #"
			Escribir "                              ##############################################################"
			Escribir ""
			Escribir "    · Sinopsis: La conmovedora y divertidísima historia de una solitaria niña hawaiana y el extraterrestre fugitivo que la ayuda a reparar su desestructurada familia."
			Escribir ""
			Escribir "    · Fecha de Estreno: 22-05-2025"
			Escribir "    · Director: Dean Fleischer-Camp"
			Escribir "    · Elenco: Maia Kealoha, Chris Sanders, Zach Galifianakis, Sydney Agudong, Kaipot Dudoit, Jolene Purdy    "
			Escribir "    · Censura: A"
			horario = 4
			
	FinSegun
FinSubProceso






//SUBPROCESO: MOSTRAMOS LOS HORARIOS DE LA PELICULA SELECCIONADA POR EL USUARIO
SubProceso MostrarHorarios(horario)
    Limpiar Pantalla
    Segun horario Hacer
        1:
            Escribir "          ########################################################"
            Escribir "          #                 HORARIOS - MINECRAFT                 #"
            Escribir "          ########################################################"
            Escribir ""
			
			Escribir "FUNCION 1:"
			Escribir "MINECRAFT - Martes 20 de mayo - SALA 1 --> 2:30 PM"
			Escribir ""
			Escribir "FUNCION 2:"
			Escribir "MINECRAFT - Martes 20 de mayo - SALA 2 --> 4:15 PM"
			
        2:
            Escribir "          #############################################################"
            Escribir "          #                 HORARIOS - THUNDERBOLTS                 #"
            Escribir "          #############################################################"
            Escribir ""
			
			Escribir "FUNCION 1:"
			Escribir "THUNDERBOLTS - Domingo 18 de mayo - SALA 3 --> 3:00 PM"
			Escribir ""
			Escribir "FUNCION 2:"
			Escribir "THUNDERBOLTS - Lunes 19 de mayo - SALA 4 --> 1:00 PM"
			
			
        3:
            Escribir "          ############################################################################"
            Escribir "          #                 HORARIOS - DESTINO FINAL LAZOS DE SANGRE                 #"
            Escribir "          ############################################################################"
            Escribir ""
			
			Escribir "FUNCION 1:"
			Escribir "DESTINO FINAL - Miércoles 21 de mayo - SALA 5 --> 5:00 PM"
			Escribir ""
			Escribir "FUNCION 2:"
			Escribir "DESTINO FINAL - Jueves 22 de mayo - SALA 6 --> 9:30 PM"
			
        4:
            Escribir "          #########################################################################"
            Escribir "          #                 HORARIOS - LILO Y STICH (LIVE ACTION)                 #"
            Escribir "          #########################################################################"
            Escribir ""
			
			Escribir "FUNCION 1:"
			Escribir "LILO Y STICH - Viernes 23 de mayo - SALA 7 - 2:45 PM"
			Escribir ""
			Escribir "FUNCION 2:"
			Escribir "LILO Y STICH - Sábado 24 de mayo - SALA 8 - 4:15 PM"
			
    FinSegun
FinSubProceso




//SUBPROCESO: INICIALIZAMOS LAS SALAS EN 0 "DISPONIBLES"
SubProceso InicializarSalas(Salas)
    Para pelicula Desde 1 Hasta 4 Hacer
        Para funcionActual Desde 1 Hasta 2 Hacer
            Para fila Desde 1 Hasta 16 Hacer
                Para columna Desde 1 Hasta 10 Hacer
                    Salas[pelicula, funcionActual, fila, columna] = "0" 
                FinPara
            FinPara
        FinPara
    FinPara
FinSubProceso


//SUBPROCESO: ASIGNAMOS 3 ASIENTOS DE MANERA ALEATORIA CON X "FUERA DE SERVICIO"
SubProceso AsignarAsientosFueraDeServicio(Salas)
	
	//Hacemos el recorrido de las 4 peliculas, las 2 funciones por pelicula
    Para pelicula Desde 1 Hasta 4 Hacer
        Para funcionActual Desde 1 Hasta 2 Hacer
            Para i Desde 1 Hasta 3 Hacer // Coloca 3 asientos fuera de servicio por sala
                filaAleatoria = Aleatorio(1, 16)
                columnaAleatoria = Aleatorio(1, 10)
                Salas[pelicula, funcionActual, filaAleatoria, columnaAleatoria] = "X" 
            FinPara
        FinPara
    FinPara
FinSubProceso



//SUBPROCESO: PRE-ASIGNAMOS EL 60% DE ASIENTOS DE LA SALA DE MANERA ALEATORIA CON A = ADULTOS ,N = NIÑOS ,T = ADULTOS MAYORES "OCUPADOS"
SubProceso LlenarAsientosAleatoriamente(Salas)
    Definir porcentajeLlenado Como Real
    Definir asientosPorSala, asientosALlenar, contador Como Entero
    Definir fila, columna Como Entero
    Definir tipoEntrada Como Caracter
    
    porcentajeLlenado = 0.60 // 60%
    asientosPorSala = 16 * 10 // 16 filas x 10 columnas
    asientosALlenar = TRUNC(asientosPorSala * porcentajeLlenado) //Quitamos la parte decimal y dejamos solo la parte entera para saber cuantos asientos vamos a llenar
    
	//Hacemos el recorrido de las 4 peliculas, las 2 funciones por pelicula
    Para pelicula Desde 1 Hasta 4 Hacer
        Para funcionActual Desde 1 Hasta 2 Hacer
            contador = 0
            Mientras contador < asientosALlenar Hacer
                fila = Aleatorio(1, 16)
                columna = Aleatorio(1, 10)
                
                // Verificamos: Solo llenar si el asiento está disponible (no es "X" ni ya está ocupado)
                Si Salas[pelicula, funcionActual, fila, columna] = "0" Entonces
                    
					// Asignar tipo de entrada aleatorio
                    Segun Aleatorio(1, 3) Hacer
                        1:
                            tipoEntrada = "A"
                        2:
                            tipoEntrada = "N"
                        3:
                            tipoEntrada = "T"
                    FinSegun
                    
                    Salas[pelicula, funcionActual, fila, columna] = tipoEntrada
                    contador = contador + 1
                FinSi
            FinMientras
        FinPara
    FinPara
FinSubProceso




//SUBPROCESO: IMPRIMIMOS LA SALA
SubProceso ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
	
	// Calcular cantidad de asientos disponibles
	Definir contadorLibres Como Entero
	contadorLibres <- 0
	
	Para fila Desde 1 Hasta 16 Hacer
		Para columna Desde 1 Hasta 10 Hacer
			Si Salas[pelicula, funcionActual, fila, columna] = "0" Entonces
				contadorLibres <- contadorLibres + 1
			FinSi
		FinPara
	FinPara
	
	
	
	Limpiar Pantalla
    Escribir "          ==========================================================="
    Escribir "                    ",NombresPeliculas[pelicula], "       SALA: ", SalasAsignadas[pelicula, funcionActual]
    Escribir "          ==========================================================="
    Escribir ""
    Escribir "          -------------------------------------------"
    Escribir "           P R E C I O   D E   L O S   B O L E T O S"
    Escribir "          -------------------------------------------"
    Escribir "          NIÑO ----------> ",Precio_Niño,"$"
    Escribir "          ADULTO --------> ",Precio_Adulto,"$"
    Escribir "          ADULTO MAYOR --> ",Precio_Adulto_Mayor,"$"
    Escribir ""
	Escribir "          Asientos disponibles en esta sala: -- ", contadorLibres," --"
    Escribir ""
    Escribir "           |-----------------------------------------------------|"
    Escribir "           |                       PANTALLA                      |"
    Escribir "           |-----------------------------------------------------|"
    Escribir ""
    Escribir "           |-----------------------------------------------------|"
    
	
	
	
	//IMPRIMIR ASIENTOS
    Para fila Desde 1 Hasta 16 Hacer
        Si fila < 10 Entonces
            Escribir Sin Saltar "      F", fila, "   |  " 
        SiNo
            Escribir Sin Saltar "      F", fila, "  |  " 
        FinSi
        
        Para columna Desde 1 Hasta 10 Hacer
            Si Salas[pelicula, funcionActual, fila, columna] = "X" Entonces
                Escribir Sin Saltar " [X] "
            FinSi
            
            Si Salas[pelicula, funcionActual, fila, columna] = "0" Entonces
                Escribir Sin Saltar " [0] "
            FinSi
            
            Si Salas[pelicula, funcionActual, fila, columna] <> "X" Y Salas[pelicula, funcionActual, fila, columna] <> "0" Entonces
                Escribir Sin Saltar " [", Salas[pelicula, funcionActual, fila, columna], "] "
            FinSi
        FinPara
        Escribir " |"
    FinPara
    
    Escribir "           |-----------------------------------------------------|"
    
    Para columna Desde 1 Hasta 10 Hacer
        si columna = 1 Entonces
            Escribir Sin Saltar "               "
        FinSi
        Escribir Sin Saltar " C", columna, "  "
    FinPara
    Escribir ""
    Escribir "          LEYENDA: [O] = Libre  [N] = Niño  [A] = Adulto  [T] = Tercera Edad  [X] = Fuera de servicio"
	Escribir ""
	Escribir "          -----------------------------------------"
    Escribir "                R E Q U E R I M I E N T O S"
    Escribir "          -----------------------------------------"
	
	
    //CALCULAR LAS BUTACAS OSUCPADA EN LA DIAGONAL PRINCIPAL (REQUERIMIENTO 1)
    Escribir ""
    Definir contadorVendidas Como Entero
    contadorVendidas <- 0
    Para fila Desde 1 Hasta 10 Hacer
        columna <- fila
        Si Salas[pelicula, funcionActual, fila, columna] <> "0" Y Salas[pelicula, funcionActual, fila, columna] <> "X" Entonces
            contadorVendidas <- contadorVendidas + 1
        FinSi
    FinPara
	
    Escribir "          1) Butacas vendidas la diagonal principal: ", contadorVendidas
    Escribir ""
	
	//CALCULAR LAS BUTACAS OSUCPADA EN LAS FILAS QUE PERTENECEN A LA SERIE FIBONACCI (REQUERIMIENTO 2)
    Definir contadorFilasFibonacci Como Entero
    contadorFilasFibonacci <- 0
    Para fila Desde 1 Hasta 16 Hacer
        Si EsFibonacci(fila) Entonces
            Para columna Desde 1 Hasta 10 Hacer
                Si Salas[pelicula, funcionActual, fila, columna] <> "0" Y Salas[pelicula, funcionActual, fila, columna] <> "X" Entonces
                    contadorFilasFibonacci <- contadorFilasFibonacci + 1
                FinSi
            FinPara
        FinSi
    FinPara
    Escribir "          2) Butacas vendidas en filas Fibonacci (1, 2, 3, 5, 8, 13): ", contadorFilasFibonacci
	Escribir ""
	
	//CALCULAR LAS BUTACAS OSUCPADA EN LAS COLUMNAS PARES (REQUERIMIENTO 3)
	Definir contadorColumnasPares Como Entero
    contadorColumnasPares <- 0
    Para fila Desde 1 Hasta 16 Hacer
        Para columna Desde 1 Hasta 10 Hacer
            Si columna % 2 = 0 Entonces
                Si Salas[pelicula, funcionActual, fila, columna] <> "0" Y Salas[pelicula, funcionActual, fila, columna] <> "X" Entonces
                    contadorColumnasPares <- contadorColumnasPares + 1
                FinSi
            FinSi
        FinPara
    FinPara
	
    Escribir "          3) Butacas vendidas en columnas pares: ", contadorColumnasPares
    Escribir ""
	
	
	//HACEMOS LAS LLAMADAS A LOS SUBPROCESOS PARA MOSTRAR LOS REQUERIMIENTOS 4,5,6,7 y 8
	//(REQUERIMIENTO 4)
	ContarButacasOcupadasColumnasImpares(Salas, pelicula, funcionActual) //mostrar mensaje en la sala de cuantas butacas hay vendidas en columnas pares
	Escribir ""
	//(REQUERIMIENTO 5)
	ContarButacasAdultos(Salas, pelicula, funcionActual) //mostrar mensaje en la sala de cuantas butacas hay de adultos
	Escribir ""
	//(REQUERIMIENTO 6)
	CalcularButacasEsquinasEnDolares(Salas, pelicula, funcionActual) //mostrar butacas vendidas solo en el cuatro esquinas
	Escribir ""
	//(REQUERIMIENTO 7)
	Asientos_Diagonal_Inversa(Salas, pelicula, funcionActual)
	Escribir ""
	//(REQUERIMIENTO 8)
	Fibonacci_Primo(Salas, pelicula, funcionActual)
	Escribir ""
	
FinSubProceso







//SUBPROCESO: RESERVACION DE LOS ASIENTOS
SubProceso ReservarAsiento(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas, totalNiños Por Referencia, totalAdultos Por Referencia, totalAdultosMayores Por Referencia, montoNiños Por Referencia, montoAdultos Por Referencia, montoAdultosMayores Por Referencia,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
    Definir filaElegida, columnaElegida Como Entero
    Definir tipoEntrada, respuesta Como Caracter
	
    Repetir
		
		
		
        Repetir
			Repetir
				Repetir
					Limpiar Pantalla
					//En caso de que el usuario se equivoque en el numero de fila volvemos a imprimir la sala para poder limpiar la pantalla pero que siga saliendo la sala
					ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor) 
					Escribir "      Ingrese la fila (1-16):"
					Leer auxiliarvalidacion
					
					Si NO EsNumero(auxiliarvalidacion) Entonces
						Escribir "      Debe ingresar un número!"
						Esperar 2 segundos
					FinSi
					
				Hasta Que EsNumero(auxiliarvalidacion)
				
				filaElegida = ConvertirANumero(auxiliarvalidacion)
				
				Si filaElegida <1 o filaElegida >16 Entonces
					
					Escribir ""
					Escribir "      Entrada invalida. Filas entre 1 y 16"
					Esperar 2 Segundos
					
				FinSi
				
			Hasta Que filaElegida >= 1 Y filaElegida <= 16
        Hasta Que filaElegida >= 1 Y filaElegida <= 16
		
		
        
        Repetir
			Repetir
				Repetir
					Limpiar Pantalla
					//En caso de que el usuario se equivoque en el numero de columna volvemos a imprimir la sala para poder limpiar la pantalla pero que siga saliendo la sala
					ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
					Escribir "      Ingrese la columna (1-10):"
					Leer auxiliarvalidacion
					
					Si NO EsNumero(auxiliarvalidacion) Entonces
						Escribir "      Debe ingresar un número!"
						Esperar 2 segundos
					FinSi
					
				Hasta Que EsNumero(auxiliarvalidacion)
				
				columnaElegida = ConvertirANumero(auxiliarvalidacion)
				
				Si columnaElegida <1 o columnaElegida >10 Entonces
					
					Escribir ""
					Escribir "      Entrada invalida. columnas entre 1 y 10"
					Esperar 2 Segundos
					
				FinSi
				
				
			Hasta Que columnaElegida >= 1 Y columnaElegida <= 10
        Hasta Que columnaElegida >= 1 Y columnaElegida <= 10
		
		
		
		
		
		//Verificamos: Si el asiento esta ocupado o fuera de servicio con A, N, T o X mandamos un mensaje al usuario y le pedimos fila y columna nuevamente
        Mientras Salas[pelicula, funcionActual, filaElegida, columnaElegida] = "A" O Salas[pelicula, funcionActual, filaElegida, columnaElegida] = "N" O Salas[pelicula, funcionActual, filaElegida, columnaElegida] = "T" O Mayusculas(Salas[pelicula, funcionActual, filaElegida, columnaElegida]) = "X" Hacer
            Escribir ""
			Escribir "!Error! Este asiento no está disponible porque esta ocupado o fuera de servicio, seleccione otro."
            Esperar 2 Segundos
			
            Repetir
				Repetir
					Repetir
						Limpiar Pantalla
						//En caso de que el usuario se equivoque en el numero de fila volvemos a imprimir la sala para poder limpiar la pantalla pero que siga saliendo la sala
						ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor) 
						Escribir "      Ingrese la fila (1-16):"
						Leer auxiliarvalidacion
						
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
						
					Hasta Que EsNumero(auxiliarvalidacion)
					
					filaElegida = ConvertirANumero(auxiliarvalidacion)
					
					Si filaElegida <1 o filaElegida >16 Entonces
						
						Escribir ""
						Escribir "      Entrada invalida. Filas entre 1 y 16"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que filaElegida >= 1 Y filaElegida <= 16
			Hasta Que filaElegida >= 1 Y filaElegida <= 16
			
			Repetir
				Repetir
					Repetir
						Limpiar Pantalla
						//En caso de que el usuario se equivoque en el numero de columna volvemos a imprimir la sala para poder limpiar la pantalla pero que siga saliendo la sala
						ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
						Escribir "      Ingrese la columna (1-10):"
						Leer auxiliarvalidacion
						
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
						
					Hasta Que EsNumero(auxiliarvalidacion)
					
					columnaElegida = ConvertirANumero(auxiliarvalidacion)
					
					Si columnaElegida <1 o columnaElegida >10 Entonces
						
						Escribir ""
						Escribir "      Entrada invalida. columnas entre 1 y 10"
						Esperar 2 Segundos
						
					FinSi
					
					
				Hasta Que columnaElegida >= 1 Y columnaElegida <= 10
			Hasta Que columnaElegida >= 1 Y columnaElegida <= 10
        FinMientras
		
		
		
		//Si el asiento esta disponible entonces preguntamos que tipo de entrada es (A, N, T) y la asignamos al asiento elegido
        Repetir
			Limpiar Pantalla
			ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
            Escribir "      Seleccione el tipo de entrada:"
            Escribir "      N -> Niño (",Precio_Niño,"$) A -> Adulto (",Precio_Adulto,"$) T -> Adulto Mayor (" Precio_Adulto_Mayor,"$)"
            Leer tipoEntrada
            tipoEntrada = Mayusculas(tipoEntrada)
			
        Hasta Que tipoEntrada = "N" O tipoEntrada = "A" O tipoEntrada = "T"
        
        Salas[pelicula, funcionActual, filaElegida, columnaElegida] = tipoEntrada //Asignamos tipo de entrada al asiento elegido
		
		//Realizamos el conteo de entradas y suma acumulada para especificarlo en la factura
		Segun tipoEntrada Hacer
			"N":
				totalNiños = totalNiños + 1
				montoNiños = montoNiños + 1
			"A":
				totalAdultos = totalAdultos + 1
				montoAdultos = montoAdultos + 2
			"T":
				totalAdultosMayores = totalAdultosMayores + 1
				montoAdultosMayores = montoAdultosMayores + 3
		FinSegun
		
		Escribir""
        Escribir "      Reserva realizada con éxito para la película ", NombresPeliculas[pelicula]
        Esperar 2 Segundos
		
        ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
		
        Repetir
			Limpiar Pantalla
			ImprimirSala(Salas, pelicula, funcionActual, NombresPeliculas, SalasAsignadas,Precio_Niño,Precio_Adulto,Precio_Adulto_Mayor)
			Escribir ""
            Escribir "      ¿Desea reservar otro asiento? (S/N)"
            Leer respuesta
            respuesta = Mayusculas(respuesta)
			
        Hasta Que respuesta = "S" O respuesta = "N"
		
    Hasta Que respuesta = "N"
	
FinSubProceso












































//SUBPROCESO: MOSTRAMOS AL USUARIO EL MENU DE LA DULCERIA
SubProceso MenuDulceria(NombreUsuario, totalNiños Por Referencia, totalAdultos Por Referencia, totalAdultosMayores Por Referencia, montoNiños Por Referencia, montoAdultos Por Referencia, montoAdultosMayores Por Referencia, PaFact Por Referencia, comproEntradas Por Referencia, comproDulceria Por Referencia)
	
    Definir opcion, opcionSubmenu, total, precio Como Real
    Definir consumo, item Como Cadena
    Definir edad, intentos Como Entero
	
	Definir año_actual, año_nacimiento_esperado, año_nacimiento_usuario Como Entero
	Definir verificacion_exitosa Como Logico
	
    total <- 0
    consumo <- ""
    intentos <- 0
	comproDulceria = Falso 
	
    Limpiar Pantalla
    Escribir "          ==============================================="
    Escribir "                    DULCERIA GESD FILMS"
    Escribir "          ==============================================="
    Repetir
		Repetir
			Repetir
				Limpiar Pantalla
				Escribir "          ==============================================="
				Escribir "                    DULCERIA GESD FILMS"
				Escribir "          ==============================================="
				Escribir "          Cliente: ", NombreUsuario
				Escribir "          Total acumulado: $", total
				Escribir ""
				Escribir "          ================ MENÚ DULCERÍA ================"
				Escribir "          1. Comida"
				Escribir "          2. Cotufas"
				Escribir "          3. Bebidas no alcohólicas"
				Escribir "          4. Chucherías"
				Escribir "          5. Combos especiales -OFERTAS-"
				Escribir "          6. Bebidas alcohólicas"
				Escribir "          7. Finalizar pedido"
				Escribir "          ==============================================="
				Escribir "          Seleccione una opción (1-7): "
				Leer auxiliarvalidacion
				
				Si NO EsNumero(auxiliarvalidacion) Entonces
					Escribir "      Debe ingresar un número!"
					Esperar 2 segundos
				FinSi
			Hasta Que EsNumero(auxiliarvalidacion)
			
			opcionn = ConvertirANumero(auxiliarvalidacion)
			
			si opcionn <1 o opcionn > 7 Entonces
				
				Escribir "          Opción inválida"
				Esperar 2 Segundos
				
			FinSi
			
			
		Hasta Que  opcionn >= 1 Y  opcionn <= 7
		
		
        Segun opcionn Hacer
            1: // Comida
				Repetir
					Repetir
						Limpiar Pantalla
						Escribir "          ==============================================="
						Escribir "                        MENÙ DE COMIDA"
						Escribir "          ==============================================="
						Escribir "          Total acumulado: $", total
						Escribir ""
						Escribir "          1. Hamburguesa - $5.00"
						Escribir "          2. Perro caliente - $3.50"
						Escribir "          3. Nachos - $4.00"
						Escribir "          4. Nuggets (6 unidades) - $6.00"
						Escribir "          5. Tequeños (8 unidades) - $5.50"
						Escribir "          6. Volver al menú principal"
						Escribir "          Seleccione su opción (1-6): "
						Leer auxiliarvalidacion
						
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
					
					si opcionSubmenu <1 o opcionSubmenu > 6 Entonces
						
						Escribir "          Opción inválida"
						Esperar 2 Segundos
						
					FinSi
					
					
				Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 6
                
				
                Segun opcionSubmenu Hacer
                    1:
                        item <- "Hamburguesa - $5.00"
                        precio <- 5.00
                    2:
                        item <- "Perro caliente - $3.50"
                        precio <- 3.50
                    3:
                        item <- "Nachos - $4.00"
                        precio <- 4.00
                    4:
                        item <- "Nuggets (6 unidades) - $6.00"
                        precio <- 6.00
                    5:
                        item <- "Tequeños (8 unidades) - $5.50"
                        precio <- 5.50
                    6:
                        item <- ""
                        precio <- 0
                    De Otro Modo:
                        Escribir "Opción no válida"
                        Esperar 2 Segundos
                        precio <- 0
                FinSegun
                
                Si precio > 0 Entonces
                    total <- total + precio
                    consumo <- consumo + item + ";" // Usamos ; como separador
                    comproDulceria = Verdadero // Solo se activa cuando se compra algo
					Escribir ""
					Escribir "          Ha seleccionado: ", item
                    Escribir "          Nuevo total: $", total
                    Esperar 1 Segundos
                FinSi
                
            2: // Cotufas
				Repetir
					Repetir
						Limpiar Pantalla
						Escribir "          ==============================================="
						Escribir "                        MENÙ DE COTUFAS"
						Escribir "          ==============================================="
						Escribir "          Total acumulado: $", total
						Escribir ""
						Escribir "          1. Pequeñas - $2.00"
						Escribir "          2. Medianas - $3.50"
						Escribir "          3. Grandes - $4.50"
						Escribir "          4. Caramelizadas - $5.00"
						Escribir "          5. Con chocolate - $5.50"
						Escribir "          6. Volver al menú principal"
						Escribir "          Seleccione su opción (1-6): "
						Leer auxiliarvalidacion
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
					
					si opcionSubmenu <1 o opcionSubmenu > 6 Entonces
						
						Escribir "          Opción inválida"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 6
                
                Segun opcionSubmenu Hacer
                    1:
                        item <- "Cotufas pequeñas - $2.00"
                        precio <- 2.00
                    2:
                        item <- "Cotufas medianas - $3.50"
                        precio <- 3.50
                    3:
                        item <- "Cotufas grandes - $4.50"
                        precio <- 4.50
                    4:
                        item <- "Cotufas caramelizadas - $5.00"
                        precio <- 5.00
                    5:
                        item <- "Cotufas con chocolate - $5.50"
                        precio <- 5.50
                    6:
                        item <- ""
                        precio <- 0
                    De Otro Modo:
                        Escribir "Opción no válida"
                        Esperar 1 Segundos
                        precio <- 0
                FinSegun
                
                Si precio > 0 Entonces
                    total <- total + precio
                    consumo <- consumo + item + ";"
					comproDulceria = Verdadero // Solo se activa cuando se compra algo
					Escribir ""
                    Escribir "          Ha seleccionado: ", item
                    Escribir "          Nuevo total: $", total
                    Esperar 2 Segundos
                FinSi
                
            3: // Bebidas no alcohólicas
                Repetir
					Repetir
						Limpiar Pantalla
						Escribir "          ==============================================="
						Escribir "                  BEBIDAS NO ALCOHÓLICAS"
						Escribir "          ==============================================="
						Escribir "          Total acumulado: $", total
						Escribir ""
						Escribir "          1. Refresco - $2.00"
						Escribir "          2. Agua mineral - $1.50"
						Escribir "          3. Jugo natural - $3.00"
						Escribir "          4. Nestea - $2.80"
						Escribir "          5. Café - $2.50"
						Escribir "          6. Volver al menú principal"
						Escribir "          Seleccione su opción (1-6): "
						Leer auxiliarvalidacion
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
					
					si opcionSubmenu <1 o opcionSubmenu > 6 Entonces
						
						Escribir "          Opción inválida"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 6
                
				
                Segun opcionSubmenu Hacer
                    1:
                        item <- "Refresco - $2.00"
                        precio <- 2.00
                    2:
                        item <- "Agua mineral - $1.50"
                        precio <- 1.50
                    3:
                        item <- "Jugo natural - $3.00"
                        precio <- 3.00
                    4:
                        item <- "Nestea - $2.80"
                        precio <- 2.80
                    5:
                        item <- "Café - $2.50"
                        precio <- 2.50
                    6:
                        item <- ""
                        precio <- 0
                    De Otro Modo:
                        Escribir "Opción no válida"
                        Esperar 1 Segundos
                        precio <- 0
                FinSegun
                
                Si precio > 0 Entonces
                    total <- total + precio
                    consumo <- consumo + item + ";"
					comproDulceria = Verdadero // Solo se activa cuando se compra algo
					Escribir ""
                    Escribir "          Ha seleccionado: ", item
                    Escribir "          Nuevo total: $", total
                    Esperar 2 Segundos
                FinSi
                
            4: // Chucherías
                Repetir
					Repetir
						Limpiar Pantalla
						Escribir "          ==============================================="
						Escribir "                        MENÚ DE CHUCHERÍAS"
						Escribir "          ==============================================="
						Escribir "          Total acumulado: $", total
						Escribir ""
						Escribir "          1. Chocolate - $2.50"
						Escribir "          2. Chupetas - $1.50"
						Escribir "          3. Mix de caramelos - $3.50"
						Escribir "          4. Gomitas - $2.80"
						Escribir "          5. Chicles - $1.20"
						Escribir "          6. Volver al menú principal"
						Escribir "          Seleccione su opción (1-6): "
						Leer auxiliarvalidacion
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
					
					si opcionSubmenu <1 o opcionSubmenu > 6 Entonces
						
						Escribir "          Opción inválida"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 6
                
                Segun opcionSubmenu Hacer
                    1:
                        item <- "Chocolate - $2.50"
                        precio <- 2.50
                    2:
                        item <- "Chupetas - $1.50"
                        precio <- 1.50
                    3:
                        item <- "Mix de caramelos - $3.50"
                        precio <- 3.50
                    4:
                        item <- "Gomitas - $2.80"
                        precio <- 2.80
                    5:
                        item <- "Chicles - $1.20"
                        precio <- 1.20
                    6:
                        item <- ""
                        precio <- 0
                    De Otro Modo:
                        Escribir "Opción no válida"
                        Esperar 1 Segundos
                        precio <- 0
                FinSegun
                
                Si precio > 0 Entonces
                    total <- total + precio
                    consumo <- consumo + item + ";"
					comproDulceria = Verdadero // Solo se activa cuando se compra algo
					Escribir ""
                    Escribir "          Ha seleccionado: ", item
                    Escribir "          Nuevo total: $", total
                    Esperar 2 Segundos
                FinSi
				
			5: 
                Repetir
					Repetir
						Limpiar Pantalla
						Escribir "          ==============================================="
						Escribir "                 COMBOS ESPECIALES - OFERTAS-"
						Escribir "          ==============================================="
						Escribir "          Total acumulado: $", total
						Escribir ""
						Escribir "          1. Combo Familiar - $15.00"
						Escribir "             - 2 Hamburguesas"
						Escribir "             - 1 Cotufas grandes"
						Escribir "             - 2 Refrescos"
						Escribir "             - 1 Chocolates"
						Escribir ""
						Escribir "          2. Combo Pareja - $12.50"
						Escribir "             - 2 Perros calientes"
						Escribir "             - 1 Cotufas medianas"
						Escribir "             - 2 Aguas minerales"
						Escribir ""
						Escribir "          3. Combo Individual - $8.00"
						Escribir "             - 1 Hamburguesa"
						Escribir "             - 1 Cotufas pequeñas"
						Escribir "             - 1 Refresco"
						Escribir ""
						Escribir "          4. Combo Premium - $20.00"
						Escribir "             - 1 Nachos"
						Escribir "             - 1 Tequeños"
						Escribir "             - 2 Refrescos"
						Escribir "             - 1 Mix de caramelos"
						Escribir ""
						Escribir "          5. Volver al menú principal"
						Escribir ""
						Escribir "          Seleccione su opción (1-5): "
						Leer auxiliarvalidacion
						Si NO EsNumero(auxiliarvalidacion) Entonces
							Escribir "      Debe ingresar un número!"
							Esperar 2 segundos
						FinSi
					Hasta Que EsNumero(auxiliarvalidacion)
					
					opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
					
					si opcionSubmenu <1 o opcionSubmenu > 5 Entonces
						
						Escribir "          Opción inválida"
						Esperar 2 Segundos
						
					FinSi
					
				Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 5
                
                Segun opcionSubmenu Hacer
                    1:
                        item <- "Combo Familiar - $15.00"
                        precio <- 15.00
                        consumo <- consumo + "Combo Familiar - $15.00;"
                    2:
                        item <- "Combo Pareja - $12.50"
                        precio <- 12.50
                        consumo <- consumo + "Combo Pareja - $12.50;"
                    3:
                        item <- "Combo Individual - $8.00"
                        precio <- 8.00
                        consumo <- consumo + "Combo Individual - $8.00;"
                    4:
                        item <- "Combo Premium - $20.00"
                        precio <- 20.00
                        consumo <- consumo + "Combo Premium - $20.00;"
                    5:
                        item <- ""
                        precio <- 0
                    De Otro Modo:
                        Escribir "          Opción no válida"
                        Esperar 1 Segundos
                        precio <- 0
                FinSegun
                
                Si precio > 0 Entonces
                    total <- total + precio
                    comproDulceria = Verdadero
					Escribir ""
                    Escribir "          Ha seleccionado: ", item
                    Escribir "          Nuevo total: $", total
                    Esperar 2 Segundos
                FinSi
				
            6: // Bebidas alcohólicas
                Limpiar Pantalla
                Escribir "          ==============================================="
                Escribir "            VERIFICACIÓN DE EDAD - BEBIDAS ALCOHÓLICAS"
                Escribir "          ==============================================="
                
                Si intentos < 3 Entonces
                    // --- Verificación de edad divertida ---
					
                    verificacion_exitosa <- Falso
                    
                    Repetir
                        Limpiar Pantalla
                        Escribir "          ==============================================="
                        Escribir "            VERIFICACIÓN DE EDAD - BEBIDAS ALCOHÓLICAS"
                        Escribir "          ==============================================="
                        
                        // --- Verificación inicial de edad ---
                        Escribir "          Para comprar bebidas alcoholicas debes ingresar tu edad:"
                        Leer edad
                        
                        Si edad < 18 Entonces
                            Escribir ""
                            Escribir "          Eres menor de edad. No puedes comprar bebidas alcoholicas."
							intentos <- intentos + 1
                            Esperar 3 Segundos
							
                            verificacion_exitosa <- Verdadero  // Salir del bucle
                        Sino
                            // --- Solo verifica a?o de nacimiento si es mayor de 18 ---
                            // Calcular a?o de nacimiento esperado (asumiendo a?o actual 2025)
                            año_actual <- 2025
                            año_nacimiento_esperado <- año_actual - edad
                            
                            // Interrogatorio rápido
                            Escribir ""
                            Escribir "          ¿En qué año naciste exactamente? ¡Responde rápido! (Tienes 3 segundos...)"
                            Esperar 2 Segundos // Simula presión
                            Leer año_nacimiento_usuario
                            
                            // Verificar consistencia
                            Si año_nacimiento_usuario = año_nacimiento_esperado Entonces
                                Escribir ""
                                Escribir "¡Tu respuesta es correcta! Y tu edad ha sido verificada exitosamente."
								Escribir "Puedes continuar a la compra de bebidas alcoholicas."
                                Esperar 2 Segundos
                                verificacion_exitosa <- Verdadero  // Salir del bucle
                                
                                // Mostrar menú de bebidas alcohólicas si la verificación es exitosa
                                Repetir
                                    Repetir
                                        Limpiar Pantalla
                                        Escribir "          ==============================================="
                                        Escribir "                    MENÚ DE BEBIDAS ALCOHÓLICAS"
                                        Escribir "          ==============================================="
                                        Escribir "          Total acumulado: $", total
                                        Escribir ""
                                        Escribir "          1. Cerveza - $4.00"
                                        Escribir "          2. Copa de vino - $6.50"
                                        Escribir "          3. Vodka (1 oz) - $8.00"
                                        Escribir "          4. Whisky (1 oz) - $10.00"
                                        Escribir "          5. Cóctel especial - $9.00"
                                        Escribir "          6. Volver al menú principal"
                                        Escribir "          Seleccione su opción (1-6): "
                                        Leer auxiliarvalidacion
                                        Si NO EsNumero(auxiliarvalidacion) Entonces
                                            Escribir "      Debe ingresar un número!"
                                            Esperar 2 segundos
                                        FinSi
                                    Hasta Que EsNumero(auxiliarvalidacion)
                                    
                                    opcionSubmenu = ConvertirANumero(auxiliarvalidacion)
                                    
                                    si opcionSubmenu <1 o opcionSubmenu > 6 Entonces
                                        Escribir "          Opción inválida"
                                        Esperar 2 Segundos
                                    FinSi
                                    
                                Hasta Que opcionSubmenu >= 1 Y opcionSubmenu <= 6
                                
                                Segun opcionSubmenu Hacer
                                    1:
                                        item <- "Cerveza - $4.00"
                                        precio <- 4.00
                                    2:
                                        item <- "Copa de vino - $6.50"
                                        precio <- 6.50
                                    3:
                                        item <- "Vodka (1 oz) - $8.00"
                                        precio <- 8.00
                                    4:
                                        item <- "Whisky (1 oz) - $10.00"
                                        precio <- 10.00
                                    5:
                                        item <- "Cóctel especial - $9.00"
                                        precio <- 9.00
                                    6:
                                        item <- ""
                                        precio <- 0
                                    De Otro Modo:
                                        Escribir "          Opcion no válida"
                                        Esperar 1 Segundos
                                        precio <- 0
                                FinSegun
                                
                                Si precio > 0 Entonces
                                    total <- total + precio
                                    consumo <- consumo + item + ";"
                                    comproDulceria = Verdadero // Solo se activa cuando se compra algo
                                    Escribir ""
                                    Escribir "          Ha seleccionado: ", item
                                    Escribir "          Nuevo total: $", total
                                    Esperar 2 Segundos
                                FinSi
                            Sino
                                Escribir ""
                                Escribir "          ¡" año_nacimiento_usuario " !" " No coincide con tu edad (" edad ")" 
                                Esperar 1 Segundo
                                Escribir "          Sospecha de fraude detectado. Activando verificación avanzada..."
                                Esperar 2 Segundos
								
								// --- Parte divertida ---
								Escribir ""
								Escribir "          Iniciando reconocimiento facial..."
								Escribir ""
								Esperar 3 Segundos
								Escribir "          Analizando imagen... por favor no te muevas"
								Esperar 2 Segundos
								Escribir "          Se han detectado arrugas, expresiones y nivel de barba, jummmm...."
								Esperar 2 Segundos
								Escribir "          Reconocimiento facial inconcluso."
								Esperar 2 Segundos
								Escribir ""
								Escribir "          Procediendo a verificación por voz."
								Esperar 3 Segundos
								Escribir ""
								Escribir "          Activando detector de voz..."
								Esperar 2 Segundos
								Escribir "          Detector de voz activado"
								Esperar 2 Segundos
								Escribir "          Por favor, habla cerca del micrófono y di: quiero ver una película"
								Esperar 2 Segundos
								Escribir "          Analizando tono de voz..."
								Esperar 3 Segundos
								Escribir "          Se ha detectado en la voz un tono agudo"
								Escribir ""
								Esperar 2 Segundos
								Escribir "          ¡¡¡¡Detectamos que eres un niño y estas mintiendo con la edad!!!!"
								Esperar 2 Segundos
								Escribir ""
								Escribir "          Lo cual es ¡¡ILEGAL!!. Procedo a llamar a la policía en..."
								Esperar 2 Segundos
								Escribir "          3....."
								Esperar 1 Segundos
								Escribir "          2....."
								Esperar 1 Segundos
								Escribir "          1....."
								Esperar 3 Segundos
								Escribir ""
								Escribir "          Tranquilo ¡Es broma!"
								Esperar 2 Segundos
								Escribir ""
								// Detector de risa
								Escribir "          Eso que detecto es...una risa"
								Esperar 2 Segundos
								Escribir "          ¡Si! Risa confirmada. Sabíamos que no podrías resistirte."
								esperar 2 Segundos
								Escribir ""
								Escribir "          Ahora, comportémonos como adultos. Vamos a intentar esto una vez más..."
								Escribir ""
								Escribir "Presiona una tecla para continuar."
								Esperar Tecla
                                intentos <- intentos + 1
								verificacion_exitosa = Verdadero
                            FinSi
                        FinSi
                    Hasta Que verificacion_exitosa = Verdadero
                Sino
                    //Por seguridad si el usuario intenta acceder mas de 3 veces al area de bebidas alcholicas esta se bloquea por completo
                    Escribir "        - ZONA BLOQUEADA - Ha excedido el número máximo de intentos para acceder a esta sección."
                    Esperar 3 Segundos
                FinSi
                
            7: // Finalizar pedido
                Escribir "          Finalizando pedido..."
				Esperar 2 Segundos
                
            De Otro Modo:
                Escribir "          Opción no válida, por favor seleccione una opción del 1 al 7."
                Esperar 2 Segundos
        FinSegun
    Hasta Que opcionn = 7
    
	// Mostrar resumen del pedido solo si se compró algo
    Si comproDulceria Entonces
		//MOSTRAMOS LOS METODOS DE PAGO
		FacturacionCompleta(NombreUsuario, PaFact, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores, consumo, total, comproEntradas, comproDulceria)
		
		
        
    Sino
        Escribir "          ==========================================================="
        Escribir "                      GESD FILMS - AVISO"
        Escribir "          ==========================================================="
        Escribir ""
        Escribir "          Estimado ", NombreUsuario, ", no realizó ninguna compra."
        Escribir ""
        Escribir "          ==========================================================="
        Esperar 2 Segundos
    FinSi
	
	
	pedirNombre = Verdadero
FinSubProceso



//SUBPROCESO: PROCESAMOS EL METODO DE PAGO QUE ELIJA EL USUARIO
SubProceso ProcesarPago(montoTotal Por Referencia, metodoPago Por Referencia, pagoCompletado Por Referencia, montoPagadoBs Por Referencia, montoPagadoDolares Por Referencia, vueltoBs Por Referencia, vueltoDolares Por Referencia)
    Definir opcion, opcionCuotas Como Entero
    Definir montoParcial, montoRestante, conversion, montoCuota Como Real
    Definir tasaDolar Como Real
    tasaDolar = 100

    
    pagoCompletado = Falso
    montoPagadoBs = 0
    montoPagadoDolares = 0
    vueltoBs = 0
    vueltoDolares = 0
    montoRestante = Redon(montoTotal * 100) / 100
    
    Repetir
        Repetir
            Repetir
                Limpiar Pantalla
                Escribir "          ==========================================================="
                Escribir "                      MÉTODOS DE PAGO DISPONIBLES"
                Escribir "          ==========================================================="
                Escribir "          Tasa de cambio del día: 1$ = ", Redon(tasaDolar * 100) / 100, " Bs"
                Escribir ""
                Escribir "          Monto restante por pagar: $", Redon(montoRestante * 100) / 100
                Escribir "          Equivalente en Bs: ", Redon(montoRestante * tasaDolar * 100) / 100, " Bs"
                Escribir ""
                Escribir "          1. Pago Móvil (Bs)"
                Escribir "          2. Tarjeta (Bs)"
                Escribir "          3. Efectivo (Bs)"
                Escribir "          4. Efectivo ($)"
                Escribir "          5. Zelle ($)"
                Escribir "          6. Cashea ($) - (Pago en cuotas para mas de 25$)"
                Escribir "          7. Finalizar pago - (Solo cuando saldo sea $0.00 o menos)"
                Escribir ""
                Escribir "          Seleccione un método de pago: "
                Leer auxiliarvalidacion
                Si NO EsNumero(auxiliarvalidacion) Entonces
                    Escribir "      Debe ingresar un número!"
                    Esperar 2 segundos
                FinSi
            Hasta Que EsNumero(auxiliarvalidacion)
            
            n1 = ConvertirANumero(auxiliarvalidacion)
            
        Hasta Que n1 >= 1 Y n1 <= 7
        
        // Verificar si Cashea es válido
        Si montoTotal < 25 Y n1 = 6 Entonces
            Escribir "          Cashea solo está disponible para montos mayores o iguales a $25"
            Esperar 2 Segundos
            n1 = 0 // Forzar a que entre en el caso "De Otro Modo"
        FinSi
        
        Segun n1 Hacer
            1: // Pago Móvil (Bs)
                Repetir
                    Repetir
                        Escribir "          Ingrese el monto a pagar en Bs: "
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    montoParcial = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que montoParcial >= 0
                
                montoParcial = Redon(montoParcial * 100) / 100
                
                Si montoParcial > 0 Entonces
                    conversion = Redon((montoParcial / tasaDolar) * 100) / 100
                    
                    Si conversion <= montoRestante Entonces
                        montoPagadoBs = Redon((montoPagadoBs + montoParcial) * 100) / 100
                        montoRestante = Redon((montoRestante - conversion) * 100) / 100
                        metodoPago = metodoPago + "Pago Móvil: " + ConvertirATexto(montoParcial) + " Bs; "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                    Sino
                        // Calcular vuelto si el pago excede el monto restante
                        vueltoBs = Redon((montoParcial - (montoRestante * tasaDolar)) * 100) / 100
                        montoPagadoBs = Redon((montoPagadoBs + (montoRestante * tasaDolar)) * 100) / 100
                        montoRestante = 0
                        metodoPago = metodoPago + "Pago Móvil: " + ConvertirATexto(montoParcial) + " Bs (con vuelto de " + ConvertirATexto(vueltoBs) + " Bs); "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                        Escribir "          Vuelto en Bs: ", vueltoBs
                    FinSi
                Sino
                    Escribir "          Monto inválido"
                FinSi
                Esperar 2 Segundos
                
            2: // Tarjeta (Bs)
                Repetir
                    Repetir
                        Escribir "          Ingrese el monto a pagar en Bs: "
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    montoParcial = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que montoParcial >= 0
                
                montoParcial = Redon(montoParcial * 100) / 100
                
                Si montoParcial > 0 Entonces
                    conversion = Redon((montoParcial / tasaDolar) * 100) / 100
                    
                    Si conversion <= montoRestante Entonces
                        montoPagadoBs = Redon((montoPagadoBs + montoParcial) * 100) / 100
                        montoRestante = Redon((montoRestante - conversion) * 100) / 100
                        metodoPago = metodoPago + "Tarjeta: " + ConvertirATexto(montoParcial) + " Bs; "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                    Sino
                        // Calcular vuelto si el pago excede el monto restante
                        vueltoBs = Redon((montoParcial - (montoRestante * tasaDolar)) * 100) / 100
                        montoPagadoBs = Redon((montoPagadoBs + (montoRestante * tasaDolar)) * 100) / 100
                        montoRestante = 0
                        metodoPago = metodoPago + "Tarjeta: " + ConvertirATexto(montoParcial) + " Bs (con vuelto de " + ConvertirATexto(vueltoBs) + " Bs); "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                        Escribir "          Vuelto en Bs: ", vueltoBs
                    FinSi
                Sino
                    Escribir "          Monto inválido"
                FinSi
                Esperar 2 Segundos
                
            3: // Efectivo (Bs)
                Repetir
                    Repetir
                        Escribir "          Ingrese el monto a pagar en Bs: "
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    montoParcial = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que montoParcial >= 0
                
                montoParcial = Redon(montoParcial * 100) / 100
                
                Si montoParcial > 0 Entonces
                    conversion = Redon((montoParcial / tasaDolar) * 100) / 100
                    
                    Si conversion <= montoRestante Entonces
                        montoPagadoBs = Redon((montoPagadoBs + montoParcial) * 100) / 100
                        montoRestante = Redon((montoRestante - conversion) * 100) / 100
                        metodoPago = metodoPago + "Efectivo Bs: " + ConvertirATexto(montoParcial) + " Bs; "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                    Sino
                        // Calcular vuelto si el pago excede el monto restante
                        vueltoBs = Redon((montoParcial - (montoRestante * tasaDolar)) * 100) / 100
                        montoPagadoBs = Redon((montoPagadoBs + (montoRestante * tasaDolar)) * 100) / 100
                        montoRestante = 0
                        metodoPago = metodoPago + "Efectivo Bs: " + ConvertirATexto(montoParcial) + " Bs (con vuelto de " + ConvertirATexto(vueltoBs) + " Bs); "
                        Escribir "          Pago registrado: ", montoParcial, " Bs (", conversion, "$)"
                        Escribir "          Vuelto en Bs: ", vueltoBs
                    FinSi
                Sino
                    Escribir "          Monto inválido"
                FinSi
                Esperar 2 Segundos
                
            4: // Efectivo ($)
                Repetir
                    Repetir
                        Escribir "          Ingrese el monto a pagar en $: "
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    montoParcial = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que montoParcial >= 0
                
                montoParcial = Redon(montoParcial * 100) / 100
                
                Si montoParcial > 0 Entonces
                    Si montoParcial <= montoRestante Entonces
                        montoPagadoDolares = Redon((montoPagadoDolares + montoParcial) * 100) / 100
                        montoRestante = Redon((montoRestante - montoParcial) * 100) / 100
                        metodoPago = metodoPago + "Efectivo $: " + ConvertirATexto(montoParcial) + "$; "
                        Escribir "          Pago registrado: ", montoParcial, "$"
                    Sino
                        // Calcular vuelto si el pago excede el monto restante
                        vueltoDolares = Redon((montoParcial - montoRestante) * 100) / 100
                        montoPagadoDolares = Redon((montoPagadoDolares + montoRestante) * 100) / 100
                        montoRestante = 0
                        metodoPago = metodoPago + "Efectivo $: " + ConvertirATexto(montoParcial) + "$ (con vuelto de " + ConvertirATexto(vueltoDolares) + "$); "
                        Escribir "          Pago registrado: ", montoParcial, "$"
                        Escribir "          Vuelto en $: ", vueltoDolares
                    FinSi
                Sino
                    Escribir "          Monto inválido"
                FinSi
                Esperar 2 Segundos
                
            5: // Zelle ($)
                Repetir
                    Repetir
                        Escribir "          Ingrese el monto a pagar en $: "
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    montoParcial = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que montoParcial >= 0
                
                montoParcial = Redon(montoParcial * 100) / 100
                
                Si montoParcial > 0 Entonces
                    Si montoParcial <= montoRestante Entonces
                        montoPagadoDolares = Redon((montoPagadoDolares + montoParcial) * 100) / 100
                        montoRestante = Redon((montoRestante - montoParcial) * 100) / 100
                        metodoPago = metodoPago + "Zelle: " + ConvertirATexto(montoParcial) + "$; "
                        Escribir "          Pago registrado: ", montoParcial, "$"
                    Sino
                        // Calcular vuelto si el pago excede el monto restante
                        vueltoDolares = Redon((montoParcial - montoRestante) * 100) / 100
                        montoPagadoDolares = Redon((montoPagadoDolares + montoRestante) * 100) / 100
                        montoRestante = 0
                        metodoPago = metodoPago + "Zelle: " + ConvertirATexto(montoParcial) + "$ (con vuelto de " + ConvertirATexto(vueltoDolares) + "$); "
                        Escribir "          Pago registrado: ", montoParcial, "$"
                        Escribir "          Vuelto en $: ", vueltoDolares
                    FinSi
                Sino
                    Escribir "          Monto inválido"
                FinSi
                Esperar 2 Segundos
                
            6: // Cashea ($) - Pago en cuotas sin interés
                // No aplica vuelto ya que es pago en cuotas
                Repetir
                    Repetir
                        Escribir "          Ha seleccionado Cashea (Pago en cuotas SIN INTERÉS)"
                        Escribir "          Monto a financiar: $", Redon(montoRestante * 100) / 100
                        Escribir "          Seleccione el plan de cuotas:"
                        Escribir ""
                        Escribir "          1. 3 cuotas mensuales de $", Redon((montoRestante/3) * 100) / 100
                        Escribir "          2. 6 cuotas mensuales de $", Redon((montoRestante/6) * 100) / 100
                        Leer auxiliarvalidacion
                        Si NO EsNumero(auxiliarvalidacion) Entonces
                            Escribir "      Debe ingresar un número!"
                            Esperar 2 segundos
                        FinSi
                    Hasta Que EsNumero(auxiliarvalidacion)
                    
                    opcionCuotas = ConvertirANumero(auxiliarvalidacion)
                    
                Hasta Que opcionCuotas >= 1 Y opcionCuotas <= 2
                
                Segun opcionCuotas Hacer
                    1:
                        montoCuota = Redon((montoRestante/3) * 100) / 100
                        montoPagadoDolares = Redon((montoPagadoDolares + montoRestante) * 100) / 100
                        metodoPago = metodoPago + "Cashea (3 cuotas de " + ConvertirATexto(montoCuota) + "$ c/u SIN INTERÉS); "
                        montoRestante = 0
                        Escribir "          Pago en cuotas registrado correctamente:"
                        Escribir "          - 3 cuotas mensuales de $", montoCuota
                        Escribir "          - Total a pagar: $", Redon(montoRestante * 100) / 100
                        Escribir "          - Fecha de pago: día 15 de cada mes"
                        
                    2:
                        montoCuota = Redon((montoRestante/6) * 100) / 100
                        montoPagadoDolares = Redon((montoPagadoDolares + montoRestante) * 100) / 100
                        metodoPago = metodoPago + "Cashea (6 cuotas de " + ConvertirATexto(montoCuota) + "$ c/u SIN INTERÉS); "
                        montoRestante = 0
                        Escribir "          Pago en cuotas registrado correctamente:"
                        Escribir "          - 6 cuotas mensuales de $", montoCuota
                        Escribir "          - Fecha de pago: día 15 de cada mes"
                        
                    De Otro Modo:
                        Escribir "          Opción inválida"
                FinSegun
                Esperar 4 Segundos
                
            7: // Finalizar pago
                Si montoRestante <= 0 Entonces
                    pagoCompletado = Verdadero
                    Escribir "          Pago completado exitosamente!"
                    Esperar 2 Segundos
                Sino
                    Escribir "          ERROR: Saldo pendiente de $", Redon(montoRestante * 100) / 100
                    Escribir "          Debe cancelar el monto completo para finalizar"
                    Esperar 3 Segundos
                FinSi
                
            De Otro Modo:
                Escribir "          Opción inválida"
                Esperar 2 Segundos
        FinSegun
    Hasta Que montoRestante <= 0 Y pagoCompletado = Verdadero
FinSubProceso













// SUBPROCESO: FACTURACIÓN COMPLETA CON LOS 3 POSIBLES CASOS
//CASO 1: SOLO COMPRO ENTRADAS (SOLO SE MUESTRA DESCRIPCION DE LAS ENTRADAS)
//CASO 2:SOLO COMPRO EN LA DULCERIA (SOLO SE MUESTRAN DETALLES DE LA DULCERIA)
//CASO 3: COMPRO EN AMBAS (SE MUESTRAN DETALLES TANTO DE LAS ENTRADAS COMO DE LA DULCERIA)
SubProceso FacturacionCompleta(NombreUsuario, PaFact, totalNiños, totalAdultos, totalAdultosMayores, montoNiños, montoAdultos, montoAdultosMayores, consumo, totalDulceria, comproEntradas, comproDulceria)
    Limpiar Pantalla
    
    // Calcular total general (redondeado a 2 decimales)
    Definir montoTotal Como Real
    montoTotal = Redon((montoNiños + montoAdultos + montoAdultosMayores + totalDulceria) * 100) / 100
    
    // Mostrar cabecera de factura
    Escribir "          ==========================================================="
    Escribir "                      GESD FILMS - FACTURA DE COMPRA"
    Escribir "          ==========================================================="
    Escribir "          Cliente: ", NombreUsuario
    Escribir "          Fecha: ", FechaActual()
    Escribir "          Hora: ", HoraActual()
    Escribir "          ==========================================================="
    Escribir ""
    
    // [Secciones de entradas y dulcería permanecen igual...]
    
    // Total general
    Escribir "          ==========================================================="
    Escribir "          TOTAL A PAGAR: $", montoTotal
    Escribir "          Equivalente en Bs: ", Redon(montoTotal * tasaDolar * 100) / 100, " Bs"
    Escribir "          ==========================================================="
    Escribir ""
    
    // Proceso de pago
    Definir metodoPago Como Cadena
    Definir pagoCompletado Como Logico
    Definir montoPagadoBs, montoPagadoDolares, vueltoBs, vueltoDolares Como Real
    
    metodoPago = ""
    ProcesarPago(montoTotal, metodoPago, pagoCompletado, montoPagadoBs, montoPagadoDolares, vueltoBs, vueltoDolares)
    
    // Mostrar factura completa después del pago
    Si pagoCompletado Entonces
        Limpiar Pantalla
        Escribir "          ==========================================================="
        Escribir "                      GESD FILMS - FACTURA FINAL"
        Escribir "          ==========================================================="
        Escribir "          Cliente: ", NombreUsuario
        Escribir "          Fecha: ", FechaActual()
        Escribir "          Hora: ", HoraActual()
        Escribir "          ==========================================================="
        Escribir ""
        
        // Sección de entradas (si las compró)
        Si comproEntradas Entonces
            Escribir "          --------------------- ENTRADAS ---------------------"
            Escribir "          Función: ", PaFact
            Escribir ""
            Escribir "          Detalle de entradas:"
            Escribir "          Niñños: ", totalNiños, " x $1.00 = $", montoNiños
            Escribir "          Adultos: ", totalAdultos, " x $2.00 = $", montoAdultos
            Escribir "          Adultos Mayores: ", totalAdultosMayores, " x $3.00 = $", montoAdultosMayores
            Escribir ""
            Escribir "          Subtotal Entradas: $", Redon((montoNiños + montoAdultos + montoAdultosMayores) * 100) / 100
            Escribir ""
        FinSi
        
        // Sección de dulcería (si compró)
        Si comproDulceria Entonces
            Escribir "          -------------------- DULCERÍA --------------------"
            Escribir "          Productos:"
            
            // Mostrar cada producto de dulcería
            Definir i, inicio Como Entero
            Definir producto Como Cadena
            
            inicio <- 1
            Para i <- 1 Hasta Longitud(consumo) Hacer
                Si Subcadena(consumo, i, i) = ";" Entonces
                    producto <- Subcadena(consumo, inicio, i - 1)
                    Si Longitud(producto) > 0 Entonces
                        Escribir "          - ", producto
                    FinSi
                    inicio <- i + 1
                FinSi
            FinPara
            
            // Mostrar el último producto si no termina con ;
            Si inicio <= Longitud(consumo) Entonces
                producto <- Subcadena(consumo, inicio, Longitud(consumo))
                Si Longitud(producto) > 0 Entonces
                    Escribir "          - ", producto
                FinSi
            FinSi
            
            Escribir ""
            Escribir "          Subtotal Dulcería: $", Redon(totalDulceria * 100) / 100
            Escribir ""
        FinSi
        
        // Resumen de pagos
        Escribir "          ================== RESUMEN DE PAGOS =================="
        Escribir "          Métodos de pago utilizados:"
        
        // Mostrar cada método de pago
        Definir j, inicioPago Como Entero
        Definir pagoMetodo Como Cadena
        
        inicioPago <- 1
        Para j <- 1 Hasta Longitud(metodoPago) Hacer
            Si Subcadena(metodoPago, j, j) = ";" Entonces
                pagoMetodo <- Subcadena(metodoPago, inicioPago, j - 1)
                Si Longitud(pagoMetodo) > 0 Entonces
                    Escribir "          - ", pagoMetodo
                FinSi
                inicioPago <- j + 1
            FinSi
        FinPara
        
        // Mostrar el último método si no termina con ;
        Si inicioPago <= Longitud(metodoPago) Entonces
            pagoMetodo <- Subcadena(metodoPago, inicioPago, Longitud(metodoPago))
            Si Longitud(pagoMetodo) > 0 Entonces
                Escribir "          - ", pagoMetodo
            FinSi
        FinSi
        
        Escribir ""
        Escribir "          Total pagado en Bs: ", Redon(montoPagadoBs * 100) / 100, " Bs"
        Escribir "          Total pagado en $: ", Redon(montoPagadoDolares * 100) / 100, "$"
        
        // Mostrar vuelto si corresponde
        Si vueltoBs > 0 Entonces
            Escribir "          Vuelto en Bs: ", vueltoBs
        FinSi
        Si vueltoDolares > 0 Entonces
            Escribir "          Vuelto en $: ", vueltoDolares
        FinSi
        
        Escribir "          ==================================================="
        Escribir ""
        Escribir "          TOTAL PAGADO: $", montoTotal
        Escribir "          ==================================================="
        Escribir ""
        Escribir "          Gracias por su compra, ", NombreUsuario, "!"
        Escribir "          Disfrute de su función en GESD FILMS"
    Sino
        Escribir "          El pago no se completó correctamente"
    FinSi
    
    Escribir ""
    Escribir "          Presione cualquier tecla para continuar..."
    Esperar Tecla
FinSubProceso


















//LOS REQUERIMIENTOS 1, 2 y 3 estan en el suproceso de imprimir sala directamente
//SUBPROCESOS DE REQUERIMIENTOS 4 , 5, 6,7 y 8
//SUBPROCESO: CALCULA LAS BUTACAS OCUPADAS EN LAS COLUMNAS IMPARES (REQUERIMIENTO 4)
SubProceso ContarButacasOcupadasColumnasImpares(Salas, pelicula, funcionActual)
    Definir contador Como Entero
    contador = 0
    
    Para fila Desde 1 Hasta 16 Hacer
        Para columna Desde 1 Hasta 10 Hacer
            Si columna % 2 <> 0 Entonces // Verifica si la columna es impar (1, 3, 5, 7, 9)
				//verifica que solos los ocupados se cuenten, y no toma en cuenta DISPONIBLE NI FUERA DE SERVICIO
                Si Salas[pelicula, funcionActual, fila, columna] <> "0" Y Salas[pelicula, funcionActual, fila, columna] <> "X" Entonces
                    contador = contador + 1
                FinSi
            FinSi
        FinPara
    FinPara
    
    Escribir "          4) Butacas vendidas/ocupadas en columnas impares de esta sala: ", contador
FinSubProceso





//SUBPROCESO: CALCULA LAS BUTACAS OCUPADAS POR ADULTOS EN LA SALA (REQUERIMIENTO 5)
SubProceso ContarButacasAdultos(Salas, pelicula, funcionActual)
    Definir contadorAdultos Como Entero
    contadorAdultos = 0
    
    Para fila Desde 1 Hasta 16 Hacer
        Para columna Desde 1 Hasta 10 Hacer
            Si Salas[pelicula, funcionActual, fila, columna] = "A" Entonces
                contadorAdultos = contadorAdultos + 1
            FinSi
        FinPara
    FinPara
    
    Escribir "          5) Butacas vendidas/ocupadas para adultos (A) en esta sala: ", contadorAdultos
FinSubProceso






//SUBPROCESO: CALCULA LAS BUTACAS OCUPADAS EN LAS ESQUINAS EN DINERO (REQUERIMIENTO 6)
SubProceso CalcularButacasEsquinasEnDolares(Salas, pelicula, funcionActual)
    Definir totalDolares Como Real
    totalDolares = 0
    
    // Coordenadas de las 4 esquinas: [fila, columna]
    Dimension esquinas[4, 2]
    esquinas[1, 1] = 1   // Fila 1, Columna 1
    esquinas[1, 2] = 1
    esquinas[2, 1] = 1   // Fila 1, Columna 10
    esquinas[2, 2] = 10
    esquinas[3, 1] = 16  // Fila 16, Columna 1
    esquinas[3, 2] = 1
    esquinas[4, 1] = 16  // Fila 16, Columna 10
    esquinas[4, 2] = 10
    
    Para i Desde 1 Hasta 4 Hacer
        // Verificar que los índices estén dentro del rango
        Si esquinas[i, 1] >= 1 Y esquinas[i, 1] <= 16 Y esquinas[i, 2] >= 1 Y esquinas[i, 2] <= 10 Entonces
            Segun Salas[pelicula, funcionActual, esquinas[i, 1], esquinas[i, 2]] Hacer
                "N":
                    totalDolares = totalDolares + 1
                "A":
                    totalDolares = totalDolares + 2
                "T":
                    totalDolares = totalDolares + 3
            FinSegun
        FinSi
    FinPara
    
    Escribir "          6) Butacas vendidas en las 4 esquinas: Valor total = $", totalDolares
FinSubProceso




// Función auxiliar para determinar si un número es parte de la serie Fibonacci
Funcion resultado <- EsFibonacci(numero)
    Definir a, b, c Como Entero
    a = 0
    b = 1
    resultado = Falso
    
    Mientras b <= numero Hacer
        Si b = numero Entonces
            resultado = Verdadero
            // En PSeInt no usamos Retornar aquí, simplemente asignamos el valor
        FinSi
        c = a + b
        a = b
        b = c
    FinMientras
FinFuncion



//SUBPROCESO: CALCULA LAS BUTACAS OCUPADAS EN LA DIAGONAL INVERSA DE LA MATRIZ (REQUERIMIENTO 7)
SubProceso Asientos_Diagonal_Inversa(Salas, pelicula, funcionActual)
	
	
	// NOTA : Si Desea comprobar que el SubProceso funciona correctamente, las posiciones de la diagonal inversa de  una matriz 16 x 10 son : //
	// (1,10) , (2,9) , (3,8) , (4,7) , (5,6) , (6,5) , (7,4) , (8,3) , (9,2) , (10,1) // 
	
	
	Definir i, j, n, m Como Entero
	Definir contadorDisponibles, contadorOcupados, contadorFueraServicio Como Entero
	
	n = 16 // Número de filas
	m = 10 // Número de columnas
	contadorDisponibles = 0 // Butacas disponibles ("0")
	contadorOcupados = 0    // Butacas ocupadas (N, A, T)
	contadorFueraServicio = 0 // Butacas fuera de servicio ("X")
	
	Para i = 1 Hasta n Hacer
		
		// Fórmula para calcular la diagonal inversa  // 
		
		j = m - i + 1 
		
		Si j >= 1 Y j <= m Entonces
			
			Segun Salas[pelicula, funcionActual, i, j] Hacer
				Caso "0":
					contadorDisponibles = contadorDisponibles + 1
				Caso "X":
					contadorFueraServicio = contadorFueraServicio + 1
				De Otro Modo:  // Considera N, A, T como ocupados // 
					contadorOcupados = contadorOcupados + 1
			FinSegun
			
		FinSi
	FinPara
	
	// Mostrar resultados en pantalla
	Escribir "          ==============================================================="
	Escribir "          7) ESTADO DE BUTACAS EN DIAGONAL INVERSA:"
	Escribir "          ==============================================================="
	Escribir "           Disponibles [0]: ", contadorDisponibles 
	Escribir "           Ocupadas [N/A/T]: ", contadorOcupados 
	Escribir "           Fuera de servicio [X]: ", contadorFueraServicio   
	Escribir "          ==================================================="
	
	Si contadorDisponibles = 0 Y contadorFueraServicio < m Entonces
		
		Escribir "          |  BUTACAS DE DIAGONAL INVERSA AGOTADAS (Todas ocupadas).  |"
		Escribir "          ==========================================================="
	FinSi
	
	
	Si contadorFueraServicio > 0 Entonces
		
		Escribir "          |  ADVERTENCIA: ", contadorFueraServicio, " butaca(s) fuera de servicio.  |"
		Escribir "          ==========================================================="
	FinSi
	
	
FinSubProceso









//SUBPROCESO: CALCULA LAS BUTACAS OCUPADAS EN LAS FILAS QUE PERTENECEN A FIBONACCI Y SON PRIMAS (REQUERIMIENTO 8)
SubProceso Fibonacci_Primo(Salas, pelicula, funcionActual)
    Definir contador Como Entero
    
    Escribir "          ================================================="
    Escribir "          8) Filas Fibonacci - Primas (Butacas ocupadas)    "
    Escribir "          ================================================="
    
    // Lista de filas especiales (Fibonacci y primas)
    Dimension filas_especiales[4]
    filas_especiales[1] <- 2
    filas_especiales[2] <- 3
    filas_especiales[3] <- 5
    filas_especiales[4] <- 13
    
    Para i <- 1 Hasta 4 Hacer
        fila <- filas_especiales[i]
        contador <- 0
        
        // Contar asientos ocupados en la fila actual ("A", "N" o "T")
        Para columna <- 1 Hasta 10 Hacer
            Si Salas[pelicula, funcionActual, fila, columna] = "A" O  Salas[pelicula, funcionActual, fila, columna] = "N" O Salas[pelicula, funcionActual, fila, columna] = "T" Entonces
                contador <- contador + 1
            FinSi
        FinPara
        
        // Mostrar resultados
        Escribir "          Fila ", fila, ": ", contador, " asientos ocupados"
    FinPara
    
    Escribir "          ============================================="
FinSubProceso









//POR SI ACASO ERAN LAS LIBRES Y NO LAS OCUPADAS
// Determinar si la fila pertenece a la serie de fibonnaci y es primo //

//SubProceso Fibonacci_Primo(Salas, pelicula, funcionActual)
//    Definir contador Como Entero
//    
//    Escribir "          ================================================="
//    Escribir "          8) Filas Fibonacci - Primas (Butacas libres)    "
//    Escribir "          ================================================="
//    
//    // Lista de filas especiales (Fibonacci y primas)
//    Dimension filas_especiales[4]
//    filas_especiales[1] <- 2
//    filas_especiales[2] <- 3
//    filas_especiales[3] <- 5
//    filas_especiales[4] <- 13
//    
//    Para i <- 1 Hasta 4 Hacer
//        fila <- filas_especiales[i]
//        contador <- 0
//        
//        // Contar asientos disponibles en la fila actual
//        Para columna <- 1 Hasta 10 Hacer
//            Si Salas[pelicula, funcionActual, fila, columna] = "0" Entonces
//                contador <- contador + 1
//            FinSi
//        FinPara
//        
//        // Mostrar resultados
//        Escribir "          Fila ", fila, ": ", contador, " asientos disponibles"
//    FinPara
//    
//    Escribir "          ============================================="
//FinSubProceso



//SUBPROCESO: MOSTRAMOS UN MENSAJE DE DESPEDIDA PARA EL USUARIO
SubProceso MostraDespedida
	Escribir "          ======================================================================="
	Escribir "          |                                                                     |"
	Escribir "          |                 GRACIAS POR USAR NUESTRO SISTEMA :)                 |"
	Escribir "          |                            REGRESA PRONTO...                        |"
	Escribir "          |                                                                     |"
	Escribir "          ======================================================================="
	
FinSubProceso



















// Función para validar números (añádela al inicio)
Funcion resultado <- EsNumero(cadena)
    Definir resultado Como Logico
    Definir i, puntos Como Entero
    
    resultado = Verdadero
    puntos = 0
    
    Si Longitud(cadena) = 0 Entonces
        resultado = Falso
    Sino
        Para i = 1 Hasta Longitud(cadena) Hacer
            Si (Subcadena(cadena, i, i) < "0" O Subcadena(cadena, i, i) > "9") Y Subcadena(cadena, i, i) <> "." Entonces
                resultado = Falso
            FinSi
            Si Subcadena(cadena, i, i) = "." Entonces
                puntos = puntos + 1
            FinSi
        FinPara
        
        Si puntos > 1 Entonces
            resultado = Falso
        FinSi
    FinSi
FinFuncion







