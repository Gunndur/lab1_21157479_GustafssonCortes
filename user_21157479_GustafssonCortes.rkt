#lang racket
(require "option_21157479_GustafssonCortes.rkt")
(require "flow_21157479_GustafssonCortes.rkt")
(require "chatbot_21157479_GustafssonCortes.rkt")
(require "chatHistory_21157479_GustafssonCortes.rkt")
(provide (all-defined-out))

                     ;-- Implementación TDA user --


#|REPRESENTACIÓN:
Este TDA representa un usuario con su nombre como id de tipo entero positivo y con un historial del chat propio de tipo chatHystory.
|#

;Opciones invalidas                    
(define user-inválido null)

#|CONSTRUCTORES:|#

;Dominio: user-name(String).
;Recorrido: user.
;Descripción: Construye un usuario utilizando solo el nombre.
;Recursividad: Nula.

(define user(lambda(name)
              (if (string? name)
                  (crear name)
                  user-inválido)))

#|SELECTORES|#
(define USER-name car);Selecciona el id del usuario, o sea su nombre.
(define USER-chatHistory cadr) ;Selecciona historial del chat del usuario.
                
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA|#

(define user?(lambda(usuario)
               (and (string? usuario))))