#lang racket
(require "option_21157479_Gustafsson.rkt")
(require "flow_21157479_Gustafsson.rkt")
(require "chatbot_21157479_Gustafsson.rkt")
(provide (all-defined-out))

                     ;-- Implementación TDA system --


#|REPRESENTACIÓN:
Este TDA representa un 
|#

;Opciones invalidas                    
(define system-inválido null)

#|CONSTRUCTORES:|#

;Dominio: name(string) x InitialChatbotCodeLink(Int) x chatbot*.
;Recorrido: system.
;Descripción: Construye un sistema completo de chatbots y deja un registro de la fecha de creación.
;Recursividad: Nula.

(define system(lambda(name InitialChatbotCodeLink . chatbot)
                (if (and (string? name)
                         (integer? InitialChatbotCodeLink) (>= InitialChatbotCodeLink 0)       ;AGREGAR HISTORIAL Y USUARIO!!!!
                         (all-chatbot? chatbot))
                         (list name InitialChatbotCodeLink (remove-duplicates (map (frente chatbot))))
                         system-inválido)))

#|SELECTORES|#
(define SYSTEM-name car);Selecciona el nombre del sistema.
(define SYSTEM-InitialChatbotCodeLink cadr) ;Selecciona el id del chatbot inicializado en el sistema correspondiente.
(define SYSTEM-chatbot caddr) ;Selecciona el o los chatbot pertenecientes al sistema.
                    
#|MODIFICADORES|#

;Dominio: system x chatbot.
;Recorrido: system.
;Descripción: Función que añade un chatbot a un sistema, si está repetido por verificación de id, no lo agrega.
;Recursividad: Nula.





#|OTRAS OPERACIONES|#

#|PERTENENCIA (NO OBLIGATORIO)|#

;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que sea de tipo system y retorna un booleano.
;Recurción: Ninguna.

(define system?(lambda(lista)
                 (and (= (length lista) 3)
                      (string? (SYSTEM-name lista))
                      (integer? (SYSTEM-InitialChatbotCodeLink lista)) (>= (SYSTEM-InitialChatbotCodeLink lista) 0)
                      (all-chatbot? (SYSTEM-chatbot lista)))))


;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que toda una lista sea de tipo system y retorna un booleano.
;Recurción: Ninguna.

(define all-system?(lambda(lista)
                      (and (= (length(remove-duplicates(map system? lista))) 1)
                           (eq? (car (remove-duplicates(map system? lista))) #t))))



