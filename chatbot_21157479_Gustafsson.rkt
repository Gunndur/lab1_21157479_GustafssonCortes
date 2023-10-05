#lang racket
(require "option_21157479_Gustafsson.rkt")
(require "flow_21157479_Gustafsson.rkt")
(provide (all-defined-out))

                     ;-- Implementación TDA chatbot --


#|REPRESENTACIÓN:
Este TDA representa un chatbot en particular, con sus respectivos flujos.
|#

;Opciones invalidas                    
(define chatbot-inválido null)

#|CONSTRUCTORES:|#

;Dominio: chatbotID(int) x name(String) x welcomeMessage(String) x startFlowId(int) x  flows
;Recorrido: chatbot.
;Descripción: Construye un chatbot y verifica que no se repita.
;Recursividad: ----

(define chatbot(lambda(chatbotID name welcomeMessage startFlowId . flows)
                 (if (and (integer? chatbotID) (>= chatbotID 0)
                          (string? name)
                          (string? welcomeMessage)
                          (integer? startFlowId) (>= startFlowId 0)
                          (all-flow? flows))
                     (list chatbotID name welcomeMessage startFlowId (remove-duplicates flows))
                     chatbot-inválido)))
 
#|SELECTORES|#
(define CHATBOT-chatbotID car);Selecciona el id del chatbot.
(define CHATBOT-name cadr) ;Selecciona el nombre del chatbot.
(define CHATBOT-welcomeMessage caddr) ;Selecciona el mensaje de bienvenida del chatbot.
(define CHATBOT-startFlowId cadddr) ; Selecciona el id del flow inicializado del chatbot.
(define CHATBOT-flows (lambda (n) (car (cddddr n)))) ;Selecciona el y/o los flows del chatbot.
                    
                    
#|MODIFICADORES|#

;Dominio: chatbot x flow.
;Recorrido: chatbot.
;Descripción: Función que añade flujos a un chatbot.
;Recursividad: cola o natural!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.

(define chatbot-add-flow(lambda(chatbot . flows)))
                          








#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#


























