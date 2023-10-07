#lang racket
(require "option_21157479_Gustafsson.rkt")
(require "flow_21157479_Gustafsson.rkt")
(require "chatbot_21157479_Gustafsson.rkt")
(require "chatHistory_21157479_Gustafsson.rkt")
(provide (all-defined-out))

                     ;-- Implementación TDA user --


#|REPRESENTACIÓN:
Este TDA representa un 
|#

;Opciones invalidas                    
(define user-inválido null)

#|CONSTRUCTORES:|#

;Dominio: name-user(String) x chatHistory.
;Recorrido: user.
;Descripción: Construye un usuario y verifica que no haya otro con el mismo rut (sin puntos ni digito verificador).
;Recursividad: Nula.

(define user(lambda(name-user . chatHistory)
              (if (and (string? name-user)
                       (all-chatHistory? chatHistory))
                  (list name-user chatHistory)
                  user-inválido)))

#|SELECTORES|#
(define USER-name-user car);Selecciona el id del usuario, o sea su nombre.
(define USER-chatHistory cadr) ;Selecciona historial del chat del usuario.

                
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#