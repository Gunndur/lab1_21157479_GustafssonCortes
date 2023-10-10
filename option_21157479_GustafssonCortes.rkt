#lang racket
(provide (all-defined-out))





                     ;-- Implementación TDA option --


#|REPRESENTACIÓN:
Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, se constituye por un id unico de tipo entero positivo,
un mensaje que entregar de tipo string, el link del id del chatbot asociado de tipo entero positivo al igual que el id del flow inicial
y también posee una lista de las palabras claves, que cada una es de tipo string.
|#

#|CONSTRUCTORES:|#

;en main

#|SELECTORES|#
(define OP-code car);Selecciona el codigo ("id") del option.
(define OP-message cadr) ;Selecciona el mensaje del option.
(define OP-ChatbotCodeLink caddr) ;Selecciona el codigo del link del chatbot asociado al option.
(define OP-InitialFlowCodeLink cadddr) ; Selecciona el codigo del link del flow inicial del option.
(define OP-Keyword (lambda (option) (car (cdr (cdr (cdr (cdr option))))))) ;Selecciona el y/o las palabras claves asociadas con el option.
                    
#|MODIFICADORES|#

;en main

#|OTRAS OPERACIONES|#
                    
(define option-inválido null);Define cuando la opción es invalida.
(define frente car);Retorna la cabeza de una lista.
(define resto cdr);Retorna la lista sin su cabeza.
(define unir cons);Retorna la union de dos listas.
(define crear list);Crea una lista.
(define juntar append);Junta dos listas.
(define (myRandom Xn) (modulo (+ (* 1103515245 Xn) 12345) 2147483648));Genera números pseudoaleatorios para usarlo en "system-simulate", que se encuentra en el main.

#|
Descripción: Funcion para verificar si es un Keyword.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#
(define Keyword?(lambda(lista)
                  (and(= (length(remove-duplicates(map string? lista))) 1)
                         (eq? (car(remove-duplicates(map string? lista))) #t))))
                    
#|PERTENENCIA|#

#|
Descripción: Verifica que sea un tipo option y retorna un booleano.
Dom: Cualquier cosa.
Rec: Booleano.
Recurción: Ninguna.
|#            

(define option?(lambda(option)
                (and (= (length option) 5)
                     (integer? (OP-code option)) (>= (OP-code option) 0)
                     (string? (OP-message option))
                     (integer? (OP-ChatbotCodeLink option)) (>= (OP-ChatbotCodeLink option) 0)
                     (integer? (OP-InitialFlowCodeLink option)) (>= (OP-InitialFlowCodeLink option) 0)
                     (Keyword? (OP-Keyword option)))))

#|
Descripción: Verifica que toda una lista sea de tipo option y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#
(define all-option?(lambda(lista)
                     (and(= (length(remove-duplicates(map option? lista))) 1)
                         (eq? (car(remove-duplicates(map option? lista))) #t))))





