#lang racket
(require "option_21157479_Gustafsson.rkt")
(provide (all-defined-out))

                     
                     ;-- Implementación TDA flow --


#|REPRESENTACIÓN:
Este TDA representa un flujo en particular sin repticiones de un chatbot.
|#

;Opciones invalidas
(define flow-inválido null)

#|CONSTRUCTORES:|#

;Dominio: id(int) x name-msg(String) x option.
;Recorrido: flow.
;Descripción: Funcion que construye un flujo de un chatbot y verifica que las opciones creadas no se repitan.
;Recursividad: Nula.

(define flow(lambda( id name-msg . option)
              (if (and (integer? id) (>= id 0)
                         (string? name-msg)
                         (list? option)
                         (all-option? option))
                  (list id name-msg (remove-duplicates option))
                  flow-inválido)))


#|SELECTORES|#
(define FLOW-id car) ;Selecciona el id del flow.
(define FLOW-name-msg cadr) ;Selecciona el nombre del mensaje asociado al flow.
(define FLOW-option caddr) ;Selecciona la lista de opciones asociadas al flow.
                    
#|MODIFICADORES|#

;Dominio: flow x option.
;Recorrido: flow.
;Descripción: Funcion que añade nuevas opciones a un flujo y también verifica que no se repita en base del id de éstos.
;Recursividad: Nula.

(define flow-add-option(lambda(flow option)
                         (if (and(flow? flow)
                                 (option? option))
                             (list (FLOW-id flow) (FLOW-name-msg flow) (remove-duplicates (append (FLOW-option flow) (list option))))
                             flow-inválido)))
                             
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#

;Dom: Lista
;Rec: Booleano.
;Descripción: Verifica que sea de tipo flow y retorna un booleano.
;Recurción: Ninguna.

(define flow?(lambda(list)
               (and(= (length list) 3)
                   (integer? (FLOW-id list))(>= (FLOW-id list) 0)
                   (string? (FLOW-name-msg list))
                   (all-option? (FLOW-option list)))))

;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que toda una lista sea de tipo flow y retorna un booleano.
;Recurción: Ninguna.
(define all-flow?(lambda(list)
                     (and(= (length(remove-duplicates(map flow? list))) 1)
                         (eq? (car(remove-duplicates(map flow? list))) #t))))



















