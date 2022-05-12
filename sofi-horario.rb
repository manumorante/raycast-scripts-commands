#!/usr/bin/env ruby

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Horario
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🌸
# @raycast.packageName Horario

# Documentation:
# @raycast.description Horario
# @raycast.author Manu Morante
# @raycast.authorURL https://github.com/manumorante

BLACK =	30
RED = 31
GREEN = 32
YELLOW = 33
BLUE = 34
MAGENTA = 35
CYAN = 36
WHITE = 97

BLACK_BG =	40
RED_BG = 41
GREEN_BG = 42
YELLOW_BG = 43
BLUE_BG = 44
MAGENTA_BG = 45
CYAN_BG = 46
WHITE_BG = 107

def c(text, color)
  "\e[#{color}m#{text}\e[0m"
end

# Configuración

PERSON = "Sofia"

# Turnos
SHIFTS = ['10:00', '12:00', '14:00', '16:00', '18:00', '20:00', '22:00' ]

# Dias de la semana en español
DAYS_NAME = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']

# Cadena para separar los dias
DAY_BREAK = "BMK"

################################################################################

raw = %Q(
10:00
(AE) Irene 2
(AE) Jesús 2
(ASE) MaJosé 2
(AV) Cristina (ETT) 2 (AV) Sara (ETT) 2 (AV) Rebeca (ETT) 2 (AV) Javier.F (ETT) 2
BMK: 7 8 0 TM: 8 TMMD: 6
(AE) Triana (ETT) 2 (AE) Jesús 2
(ASE) MaJosé 2
(AV) Cristina (ETT) 2 (AV) Nati (ETT) 2 (AA) Javier.F (ETT) 2 (AV) Marta (ETT) 2
BMK: 2 4 2 TM: 6 TMMD: 8
(AE) Katia 2
(ASE) Miguel 2
(AE) Paqui 2
(AA) Lidia 2
(AV) Santi (ETT) 2 (AV) Sofia (ETT) 2 (AV) Marisol (ETT) 2
BMK: 0 0 0 TM: 0 TMMD: 14
(AE) Paqui 2
(ASE) Miguel 2
(AE) Pereira 2
(AA) Lidia 2
(AV) Rebeca (ETT) 2 (AV) Marta (ETT) 2 (AV) Jessica (ETT) 2
BMK: 0 0 0 TM: 0 TMMD: 14
(AE) Maria 2
(AE) Paqui 2
(ASE) Miguel 2
(AA) Lidia 2
(AV) Nati (ETT) 2
(AV) R.Martínez (ETT) 2 (AV) C.García (ETT) 2 (AV) Eli (ETT) 2
BMK: 11 12 4 TM: 16 TMMD: 0
(AE) Pereira 2
(AE) Paqui 2
(ASE) Miguel 2
(AV) Maria 2
(AV) Sara (ETT) 2 (AV) Marta (ETT) 2 (AV) Jessica (ETT) 2 (M) Dani (ETT) 2
(M) C.García (ETT) 2
BMK: 14 20 0 TM: 20 TMMD: -2
(AE) Maria 2
(AE) Paqui 2
(ASE) Miguel 2
(AA) Lidia 2
(AV) Katia 2
(AV) Ramón (ETT) 2 (AV) Nati (ETT) 2 (M) Juanma (ETT) 2 (M) Marisol (ETT) 2
BMK: 32 32 0 TM: 32 TMMD: -14
12:00
(A) Irene 2
(AV) Jesús 2
(AA) MaJosé 2
(M) Cristina (ETT) 2 (AV) Sara (ETT) 2 (AV) Rebeca (ETT) 2 (M) Javier.F (ETT) 2 (AV) Triana (ETT) 2 (M) Juanma (ETT) 2
BMK: 12 16 2 TM: 18 TMMD: 0
(AV) Triana (ETT) 2 (A) Irene 2
(AV) Jesús 2
(AA) MaJosé 2
(M) Cristina (ETT) 2 (AV) Nati (ETT) 2
(M) R.Martínez (ETT) 2 (M) Javier.F (ETT) 2 (AV) Marta (ETT) 2
BMK: 4 7 1 TM: 8 TMMD: 10
(AV) Paqui 2
(AV) Katia 2
(A) Miguel 2
(AA) Pereira 2
(M) Lidia 2
(AV) Santi (ETT) 2 (AV) Sofia (ETT) 2 (M) Marisol (ETT) 2 (M) Dani (ETT) 2
BMK: 6 8 4 TM: 12 TMMD: 6
(A) Maria 2
(AV) Pereira 2
(AV) Paqui 2
(AV) Katia 2
(AA) Miguel 2
(M) Lidia 2
(M) Rebeca (ETT) 2 (AV) Marta (ETT) 2 (M) Jessica (ETT) 2
BMK: 8 8 2 TM: 10 TMMD: 8
(AA) Maria 2
(AV) Pereira 2
(AV) Paqui 2
(AV) Katia 2
(A) Miguel 2
(M) Lidia 2
(AV) Nati (ETT) 2
(M) R.Martínez (ETT) 2 (M) Eli (ETT) 2
(M) C.García (ETT) 2
BMK: 9 10 0 TM: 10 TMMD: 10
(AV) Maria 2
(AV) Pereira 2
(AV) Paqui 2
(AA) Katia 2
(A) Miguel 2
(M) Sara (ETT) 2 (M) Marta (ETT) 2 (AV) Jessica (ETT) 2 (M) Dani (ETT) 2
(M) C.García (ETT) 2 (M) Rebeca (ETT) 2
BMK: 20 36 6 TM: 42 TMMD: -20
(AA) Maria 2
(AV) Paqui 2
(A) Miguel 2
(M) Lidia 2
(AV) Pereira 2
(A) Katia 2
(M) Ramón (ETT) 2 (AV) Nati (ETT) 2 (M) Juanma (ETT) 2 (M) Marisol (ETT) 2
BMK: 31 31 0 TM: 31 TMMD: -11

14:00
(A) Irene 2
(AA) MaJosé 3
(AV) Jesús 2
(AV) R.Martínez (ETT) 2 (AV) Juanma (ETT) 2 (M) Marisol (ETT) 2
(M) Javier.F (ETT) 2 (AV) Triana (ETT) 2
(M) Dani (ETT) 2
BMK: 1 2 0 TM: 2 TMMD: 17
(AA) Irene 2
(AV) Jesús 2
(A) MaJosé 2
(AV) R.Martínez (ETT) 2 (M) Javier.F (ETT) 2 (AV) Jessica (ETT) 2 (AV) Triana (ETT) 2
(M) Eli (ETT) 2
(M) Fernando (ETT) 2
BMK: 2 2 0 TM: 2 TMMD: 16
(AV) Katia 2
(AV) Paqui 2
(A) Miguel 2
(AA) Pereira 2
(M) Cristina (ETT) 2
(M) Santi (ETT) 2
(AV) R.Martínez (ETT) 2 (M) Dani (ETT) 2
(AV) C.García (ETT) 2
BMK: 5 8 3 TM: 11 TMMD: 7
(AV) Maria 2
(AA) Pereira 2
(AV) Katia 2
(A) Miguel 2
(AV) Nati (ETT) 2 (AV) Marta (ETT) 2 (M) Jessica (ETT) 2 (M) Eli (ETT) 2
(M) Fernando (ETT) 2
BMK: 7 10 0 TM: 10 TMMD: 8
(AV) Maria 2
(A) Pereira 2
(AV) Katia 2
(AA) Miguel 2
(AV) Santi (ETT) 2 (M) Sofia (ETT) 2 (AV) Sara (ETT) 2 (M) Marisol (ETT) 2 (M) Fernando (ETT) 2
BMK: 3 3 0 TM: 3 TMMD: 15
(A) Maria 2
(AV) Pereira 2
(AV) Paqui 2
(AV) Katia 2
(AA) Miguel 2
(AV) Lidia 2
(M) Rebeca (ETT) 2 (M) Ramón (ETT) 2 (M) Nati (ETT) 2
(M) C.García (ETT) 2
BMK: 13 15 2 TM: 17 TMMD: 3
(M) Lidia 2
(A) Maria 2
(AV) Pereira 2
(AV) Paqui 2
(AV) Katia 2
(AA) Miguel 2
(M) Cristina (ETT) 2 (M) Jessica (ETT) 2 (M) Eli (ETT) 2
(AV) Fernando (ETT) 2
BMK: 18 28 5 TM: 33 TMMD: -13
16:00
(A) MaJosé 2
(M) Ramón (ETT) 2 (M) R.Martínez (ETT) 2 (M) Juanma (ETT) 2 (M) Marisol (ETT) 2 (AV) Eli (ETT) 2
(AV) Triana (ETT) 2 (AV) Fernando (ETT) 2 (M) Dani (ETT) 2
BMK: 16 26 1 TM: 27 TMMD: -9
(AA) Irene 2
(A) MaJosé 2
(AV) Santi (ETT) 2 (AV) Sofia (ETT) 2 (AV) Jessica (ETT) 2 (M) Eli (ETT) 2
(AA) Fernando (ETT) 2 (M) Dani (ETT) 2
(M) Rebeca (ETT) 2
BMK: 16 16 4 TM: 20 TMMD: -2
(A) Pereira 2
(M) Cristina (ETT) 2 (AV) R.Martínez (ETT) 2 (AV) Juanma (ETT) 2 (AV) Marta (ETT) 2
(M) Nati (ETT) 2
(M) Jessica (ETT) 2
(M) Dani (ETT) 2
(AV) C.García (ETT) 2
BMK: 5 5 0 TM: 5 TMMD: 13
(A) Maria 2
(AA) Katia 2
(AV) Nati (ETT) 2
(M) Ramón (ETT) 2 (AV) Eli (ETT) 2
(AV) Fernando (ETT) 2 (M) Dani (ETT) 2
(AV) C.García (ETT) 2 (M) Sara (ETT) 2
BMK: 10 16 0 TM: 16 TMMD: 2
(A) Pereira 2
(AA) Katia 2
(AV) Santi (ETT) 2 (AV) Sofia (ETT) 2 (AV) Sara (ETT) 2 (M) Marisol (ETT) 2 (M) Marta (ETT) 2 (AV) Jessica (ETT) 2 (M) Dani (ETT) 2
(M) Fernando (ETT) 2
BMK: 5 9 4 TM: 13 TMMD: 7
(AA) Katia 2
(A) Miguel 2
(AV) Lidia 2
(M) Rebeca (ETT) 2 (M) Ramón (ETT) 2 (AV) Nati (ETT) 2
(AV) Eli (ETT) 2
(AV) Fernando (ETT) 2 (M) Dani (ETT) 2
(M) Cristina (ETT) 2
BMK: 15 35 6 TM: 41 TMMD: -21
(AA) Pereira 2
(A) Miguel 2
(M) Cristina (ETT) 2 (AV) Marta (ETT) 2 (AV) Santi (ETT) 2 (M) Sara (ETT) 2 (AV) Sofia (ETT) 2 (M) Jessica (ETT) 2 (AV) Eli (ETT) 2
(M) Fernando (ETT) 2
BMK: 24 42 2 TM: 44 TMMD: -24
18:00
(AA) Mbo (ETT) 2
(A) Primi 2
(AA) Eugenia 2
(AV) Santi (ETT) 2 (AV) Sofia (ETT) 2 (M) Ramón (ETT) 2 (AV) Eli (ETT) 2
(M) Fernando (ETT) 2 (M) Dani (ETT) 2
(AV) C.García (ETT) 2
BMK: 18 29 7 TM: 36 TMMD: -16
(A) Rubén 2
(AV) Toro 2
(AA) Eugenia 2
(AV) Santi (ETT) 2 (A) Sofia (ETT) 2
(M) Sara (ETT) 2 (AV) Rebeca (ETT) 2 (AV) Eli (ETT) 2
(M) Fernando (ETT) 2 (M) Dani (ETT) 2
BMK: 12 24 4 TM: 28 TMMD: -8
(A) Rubén 2
(AA) Eugenia 2
(AV) Mbo (ETT) 2
(AV) Monica (ETT) 2 (M) Nati (ETT) 2
(M) Cristina (ETT) 2 (M) Juanma (ETT) 2 (M) R.Martínez (ETT) 2 (AV) Marta (ETT) 2 (AV) Jessica (ETT) 2
BMK: 8 14 2 TM: 16 TMMD: 4
(A) Rubén 2
(AV) Eugenia 2
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (M) Sara (ETT) 2
(M) Ramón (ETT) 2 (M) Eli (ETT) 2
(AV) Nati (ETT) 2 (AV) Dani (ETT) 2 (M) C.García (ETT) 2
BMK: 4 8 2 TM: 10 TMMD: 10
(AA) Toro 2
(A) Eugenia 2
(M) Cristina (ETT) 2 (AV) Sara (ETT) 2 (AV) Marta (ETT) 2 (AV) Jessica (ETT) 2 (M) Santi (ETT) 2
(M) Sofia (ETT) 2
(M) Dani (ETT) 2
(M) Marisol (ETT) 2 (M) Fernando (ETT) 2
BMK: 13 22 5 TM: 27 TMMD: -5
(A) MaJosé 2
(AA) Triana (ETT) 2 (AV) Javier.F (ETT) 2 (M) Cristina (ETT) 2 (AV) R.Martínez (ETT) 2 (M) Juanma (ETT) 2 (AV) Marisol (ETT) 2 (AV) Eli (ETT) 2
(M) Fernando (ETT) 2 (M) Ramón (ETT) 2
(M) Nati (ETT) 2
BMK: 24 44 8 TM: 52 TMMD: -30
(AA) Jesús 2
(A) MaJosé 2
(AV) Santi (ETT) 2 (AV) Javier.F (ETT) 2 (AV) Sofia (ETT) 2 (M) Sara (ETT) 2
(M) Rebeca (ETT) 2 (M) Cristina (ETT) 2 (AV) Marta (ETT) 2 (M) Jessica (ETT) 2 (M) Eli (ETT) 2
BMK: 22 37 8 TM: 45 TMMD: -23

20:00
(AV) Monica (ETT) 2 (M) Mbo (ETT) 2 (AV) Primi 2
(A) Rubén 2
(AA) Eugenia 2
(AV) Toro 2
(M) Santi (ETT) 2 (AV) Sofia (ETT) 2 (M) Ramón (ETT) 2 (M) C.García (ETT) 2
BMK: 8 16 4 TM: 20 TMMD: 0
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AA) Eugenia 2
(AV) Toro 2
(AV) Primi 2
(M) Sara (ETT) 2
(M) Rebeca (ETT) 2 (M) Dani (ETT) 2
(M) C.García (ETT) 2
BMK: 8 16 2 TM: 18 TMMD: 2
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AA) Eugenia 2
(AV) Toro 2
(AV) Primi 2
(M) Nati (ETT) 2
(M) Ramón (ETT) 2 (M) Marta (ETT) 2 (M) Jessica (ETT) 2
BMK: 5 12 0 TM: 12 TMMD: 8
(M) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AA) Eugenia 2
(AV) Toro 2
(AV) Primi 2
(AV) Sara (ETT) 2 (M) Ramón (ETT) 2 (M) Juanma (ETT) 2 (M) Marisol (ETT) 2
BMK: 12 26 4 TM: 30 TMMD: -10
(AV) Toro 2
(A) Rubén 2
(AA) Eugenia 2
(AV) Primi 2
(M) Mbo (ETT) 2 (AV) Monica (ETT) 2 (M) Cristina (ETT) 2 (M) Ramón (ETT) 2 (AV) Rebeca (ETT) 2 (M) Juanma (ETT) 2
BMK: 12 26 0 TM: 26 TMMD: -6
(AA) Irene 2
(AV) Jesús 2
(A) MaJosé 2
(AV) Triana (ETT) 2 (AV) Javier.F (ETT) 2 (M) Cristina (ETT) 2 (M) R.Martínez (ETT) 2 (M) Juanma (ETT) 2 (M) Marisol (ETT) 2 (AV) Sofia (ETT) 2
(M) Santi (ETT) 2
BMK: 16 28 6 TM: 34 TMMD: -12
(AA) Irene 2
(A) MaJosé 2
(AV) Triana (ETT) 2 (AV) Javier.F (ETT) 2 (AV) Santi (ETT) 2 (AV) Sofia (ETT) 2
(M) Sara (ETT) 2
(M) Rebeca (ETT) 2 (M) R.Martínez (ETT) 2 (M) Jesús 2
BMK: 19 37 6 TM: 43 TMMD: -23
22:00
(AV) Monica (ETT) 2 (AA) Mbo (ETT) 2 (A) Rubén 2
(AV) Toro 2
(AV) C.García (ETT) 2
BMK: 11 14 0 TM: 14 TMMD: -4
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AV) Toro 2
(AA) Primi 2
(M) C.García (ETT) 2
BMK: 8 9 2 TM: 11 TMMD: 1
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AV) Toro 2
(AA) Primi 2
(AV) Ramón (ETT) 2
BMK: 9 9 0 TM: 9 TMMD: 3
(AV) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AV) Toro 2
(AA) Primi 2
(AV) Juanma (ETT) 2 (M) Marisol (ETT) 2
BMK: 6 12 0 TM: 12 TMMD: 2
(AV) Toro 2
(M) Mbo (ETT) 2 (AV) Monica (ETT) 2 (A) Rubén 2
(AA) Primi 2
(AV) Rebeca (ETT) 2 (M) Ramón (ETT) 2 (M) Juanma (ETT) 2
BMK: 8 8 2 TM: 10 TMMD: 6
(AV) Lidia 2
(AA) Irene 2
(AV) Jesús 2
(A) MaJosé 2
(AV) Triana (ETT) 2 (AV) Javier.F (ETT) 2 (M) Santi (ETT) 2
(M) Sofia (ETT) 2
BMK: 11 14 4 TM: 18 TMMD: -2
(AV) Irene 2
(AA) Jesús 2
(A) MaJosé 2
(AV) Triana (ETT) 2 (AV) Javier.F (ETT) 2 (AV) R.Martínez (ETT) 2 (M) Rebeca (ETT) 2
BMK: 21 25 5 TM: 30 TMMD: -16
24:00
(AA) Monica (ETT) 2 (A) Rubén 2
(M) Toro 2
BMK: 0 0 0 TM: 0 TMMD: 6
(AA) Monica (ETT) 2 (M) Mbo (ETT) 2
(A) Primi 2
BMK: 0 0 0 TM: 0 TMMD: 6
(A) Primi 2
(AA) Toro 2
(M) Ramón (ETT) 2
BMK: 2 2 0 TM: 2 TMMD: 4
(AA) Toro 2
(A) Primi 2
(M) Juanma (ETT) 2 (M) Marisol (ETT) 2
BMK: 2 0 0 TM: 0 TMMD: 8
(M) Mbo (ETT) 2 (M) Monica (ETT) 2 (A) Rubén 2
(AA) Primi 2
BMK: 2 4 0 TM: 4 TMMD: 4
(A) MaJosé 2
(M) Irene 2
(AA) Jesús 2
(M) Santi (ETT) 2 (M) Sofia (ETT) 2
BMK: 0 0 0 TM: 0 TMMD: 10
(M) Triana (ETT) 2
(A) Irene 2
(M) R.Martínez (ETT) 2
BMK: 6 2 2 TM: 4 TMMD: 2
Trabajadores que descansan:
Tipo de trajador: (MJT) Masajista (RCT) Recepcionista (MTN) Mantenimiento (LPZ) Limpieza
Roles masajistas: (M) Masajista (A) Anfitrión (AV) Ayudante de vestuario (AA) Ayudante de anfitrión (ASE) Anfitrión servicios especiales (AZ) Anfitrion zaguán (AE) Masajista servicio estacional TMMD: Total de masajes por masajistas disponibles TM: Total de masajes reservados

)

# Quitar saltos de linea
RAW = raw.tr("\n", " ")

# Crea array con posicion cada turno
SHIFTS_POS = []
SHIFTS.each_with_index do | hour, index |
  SHIFTS_POS[index] = RAW.index(SHIFTS[index])
end

# Salida: dias con la informacion de turnos
DAYS_WORK = [[], [], [], [], [], [], []]
def generateWorkDays(days, index)
  7.times do |i|
    if days[i].include?(PERSON)
      DAYS_WORK[i] << SHIFTS[index]
    end
  end
end

# Recorro las posiciones para tomar el contenido que hay entre cada dos turnos.
# Ese contenido será todos los dias del turno.
7.times do | shift_pos_i |
  current_pos = SHIFTS_POS[shift_pos_i]
  next_pos = SHIFTS_POS[shift_pos_i + 1]
  
  # Fila de hora contine todos los dias para la hora actual
  shift_row = RAW[current_pos..next_pos]

  # Separar los dias de cada hora
  days = shift_row.split(DAY_BREAK)

  generateWorkDays(shift_row.split(DAY_BREAK), shift_pos_i)
end

7.times do | i |
  if DAYS_WORK[i].length <= 0
    puts c("#{DAYS_NAME[i]} libre", GREEN)
  else
    puts "#{c(c(DAYS_NAME[i], WHITE), BLACK_BG)} #{DAYS_WORK[i].join(", ")}"
  end
end

changelog = [
  "0.0.1 - Copiar y pegar texto de PDF",
  "0.0.2 - Manejar texto con 'heredoc",
  "0.0.3 - Separar y comenzar a pintar",
  "0.1.0 - Primeros resultados",
  "0.1.1 - Reordenar arrays",
  "0.2.1 - Afinar resultados",
  "0.2.2 - Formatear texto",
  "1.0.0 - Primera version con texto real y bonito",
  "1.0.1 - Changelog",
  "1.0.2 - WIP mostrar la hora de entrada y salida",
]
