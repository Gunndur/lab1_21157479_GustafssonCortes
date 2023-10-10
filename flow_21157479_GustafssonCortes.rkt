#lang racket
(require "option_21157479_GustafssonCortes.rkt")
(provide (all-defined-out))




                     ;-- Implementación TDA flow --


#|REPRESENTACIÓN:
Este TDA representa un flujo en particular sin ningun tipo de repticion de un chatbot, este se representa por un id unico de tipo entero positivo,
un nombre del mensaje propiamente tal del flujo de tipo strinng y un listado de las posibles opciones a escoger, donde cada uno de los elementos es de tipo option.
|#

#|CONSTRUCTORES:|#

;en main

#|SELECTORES|#
(define FLOW-id car) ;Selecciona el id del flow.
(define FLOW-name-msg cadr) ;Selecciona el nombre del mensaje asociado al flow.
(define FLOW-option caddr) ;Selecciona la lista de opciones asociadas al flow.
                    
#|MODIFICADORES|#

;en main

#|OTRAS OPERACIONES|#

(define flow-inválido null);Define cuando el flow es invalido.

#|PERTENENCIA|#

#|
Descripción: Verifica que sea de tipo flow y retorna un booleano.
Dom: Lista
Rec: Booleano.
Recurción: Ninguna.
|#
(define flow?(lambda(lista)
               (and (= (length lista) 3)
                    (integer? (FLOW-id lista))(>= (FLOW-id lista) 0)
                    (string? (FLOW-name-msg lista))
                    (all-option? (FLOW-option lista)))))


#|
Descripción: Verifica que toda una lista sea de tipo flow y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#
(define all-flow?(lambda(lista)
                     (and (= (length(remove-duplicates(map flow? lista))) 1)
                          (eq? (car(remove-duplicates(map flow? lista))) #t))))



















