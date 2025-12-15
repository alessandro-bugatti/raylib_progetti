# 🕹️ Come creare un nuovo progetto Raylib

Questa cartella è pensata per contenere **più progetti Raylib** che condividono la
stessa libreria, con lo scopo di offrire una 
modalità semplice per creare dei progetti che
usano la libreria senza doversi preoccupare degli aspetti
legati a compilazione/linking di una libreria esterna.
Quanto proposto è stato testato con [CLion](https://www.jetbrains.com/clion/), ma dovrebbe
funzionare su qualsiasi ambiente che supporti CMake.

Per creare un **nuovo progetto**, segui **esattamente** questi passaggi,
in ordine.

⚠️ **Non saltare nessun passaggio**.

------------------------------------------------------------------------

## 📁 Struttura di base (non modificare)

All'inizio di questa cartella troverai una sottocartella `projects` organizzata in questo modo:

    projects/
    ├── CMakeLists.txt
    ├── hello_world/
    │   ├── CMakeLists.txt
    │   ├── src/
    │   │   └── main.cpp
    │   └── assets/

Il progetto `hello_world` è un esempio, verifica che funzioni
attraverso il solito tasto di compilazione ed esecuzione presente in CLion 
(o dove è previsto se utilizzo un IDE differente).

------------------------------------------------------------------------

## ✅ Obiettivo

Creare un **nuovo progetto Raylib** (ad esempio `my_game`) partendo da
`hello_world`.

------------------------------------------------------------------------

## ✨ Passaggi per creare un nuovo progetto

### 1️⃣ Copia il progetto di esempio

Dentro la cartella `projects`:

-   copia la cartella `hello_world`
-   incolla la copia dentro **project**
-   rinomina la copia con il nome del tuo progetto

Esempio:

    hello_world_copia  →  my_game

------------------------------------------------------------------------

### 2️⃣ Rinomina il progetto nel suo CMakeLists.txt

Apri il file:

    projects/my_game/CMakeLists.txt

Troverai una riga simile a questa:

``` cmake
add_raylib_app(hello_world src/main.cpp)
```

🔁 **Sostituisci `hello_world` con il nome della cartella**, ad esempio:

``` cmake
add_raylib_app(my_game src/main.cpp)
```

💡 Il nome **deve essere uguale** al nome della cartella.

------------------------------------------------------------------------

### 3️⃣ Registra il progetto (PASSAGGIO OBBLIGATORIO)

Apri il file:

    projects/CMakeLists.txt

Vedrai qualcosa di simile:

``` cmake
add_subdirectory(hello_world)
```

➕ **Aggiungi una nuova riga** con il nome del tuo progetto:

``` cmake
add_subdirectory(hello_world)
add_subdirectory(my_game)
```

⚠️ Se **non fai questo passaggio**, il progetto **non verrà compilato**.

------------------------------------------------------------------------

### 4️⃣ Scrivi il tuo codice

Ora puoi lavorare su:

    projects/my_game/src/main.cpp

Se servono immagini, suoni, font, mettili in:

    projects/my_game/assets/

------------------------------------------------------------------------

## ▶️ Compilare ed eseguire

Troverai il tuo programma (`my_game`) tra gli 
eseguibili disponibili (in CLion il menù a tendina in 
fianco ai bottoni per la compilazione).

Compilalo ed eseguilo normalmente.

------------------------------------------------------------------------

## ❓ Regole importanti (da ricordare)

-   ❌ **Non modificare** la cartella `libs`
-   ❌ **Non toccare** i CMakeLists fuori da `projects`
-   ✅ Lavora solo nella **tua cartella di progetto**
-   ✅ Se copi un progetto, **rinomina sempre tutto correttamente**

------------------------------------------------------------------------

## 🆘 Se qualcosa non funziona

Controlla: 
1. Il nome della cartella 
2. Il nome dentro
`add_raylib_app(...)` del `CMakeLists.txt` che si trova nella cartella del nuovo progetto
3. La riga `add_subdirectory(...)` in
`projects/CMakeLists.txt`

Se uno di questi tre è sbagliato, il progetto non comparirà.
