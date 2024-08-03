( Programme principal-Main program )
: HI ." Bonjour tout le monde" ;

: robot CR ."           _  " CR ."        __|_|__   " CR ."       |  o o  |  " CR
."      [|   !   |]  " CR    ."     __|  <=>  |__  " CR  ."    |  ^^^^^^^^   | " CR  ."    |  | robot |  |  " CR
."    |  |_______|  |    " CR ."    |__|       |__|    " CR
; 
 
robot CR
HI  CR

( my own return stack - ma propre pile de retour R )
VARIABLE R   
: >R  R ! ;
: R> R @ ;

( timer env. 1 sec )
: MS ( n -- n sec ) 34333 * FOR I DROP NEXT ;
: X 10000 FOR DROP NEXT ;


CODE PAGE
    print('\033c')
END-CODE
" initlf1.fth" LOAD ( capteur de gauche-left sensor  ) 
" initlf2.fth" LOAD ( capteur de droite-right sensor  )
" MotorAV.fth" LOAD ( moteur avance à 50 pour cent-engine advances to 50 percent )
" MotorStop.fth" LOAD ( moteur arrêt-engine stop )
" TurnD.fth" LOAD ( tourne à droite-turn right )
" TurnG.fth" LOAD ( tourne à gauche-turn left )

( applications avec deux capteurs LTR 4206)
( applications with two LTR 4206 sensors )
: TOPLF BEGIN INITLF1 INITLF2 + 0=  IF MOTORAV THEN INITLF1 1 =  IF TURND  MOTORAV THEN INITLF2  1 =  IF TURNG  MOTORAV THEN  INITLF1 INITLF2 + 2 =  IF MOTORSTOP ;; THEN AGAIN ;
( tests )
: t INITLF1 INITLF2 ." GL :" .  ."  " ." DR :" . ;
: T TOPLF ;

WORDS CR
