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
(define CHATBOT-startFlowId cadddr) ; Selecciona el id del flow inicializado en el chatbot correspondiente.
(define CHATBOT-flows (lambda (n) (car (cddddr n)))) ;Selecciona el y/o los flows del chatbot.
                    
                    
#|MODIFICADORES|#

;Dominio: chatbot x flow.
;Recorrido: chatbot.
;Descripción: Función que añade flujos a un chatbot.
;Recursividad: Natural.

(define chatbot-add-flow(lambda(chatbot flow)
                          (define cb-add-fl(lambda(cb fl)
                                             (if (null? (CHATBOT-flows cb))
                                                 fl
                                                 (if (= (FLOW-id (frente (CHATBOT-flows cb))) (FLOW-id fl))
                                                     cb
                                                     (unir (frente (CHATBOT-flows cb)) (cb-add-fl (resto (CHATBOT-flows cb)) fl))))))
                          (cb-add-fl chatbot flow)))

#|OTRAS OPERACIONES|#
                  
#|PERTENENCIA (NO OBLIGATORIO)|#

;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que sea de tipo chatbot y retorna un booleano.
;Recurción: Ninguna.

(define chatbot?(lambda(lista)
                  (and (= (length lista) 5)
                       (integer? (CHATBOT-chatbotID lista)) (>= (CHATBOT-chatbotID lista) 0)
                       (string? (CHATBOT-name lista))
                       (string? (CHATBOT-welcomeMessage lista))
                       (integer? (CHATBOT-startFlowId lista)) (>= (CHATBOT-startFlowId lista) 0)
                       (all-flow? (CHATBOT-flows lista)))))
                 

;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que toda una lista sea de tipo chatbot y retorna un booleano.
;Recurción: Ninguna.

(define all-chatbot?(lambda(lista)
                      (and (= (length(remove-duplicates(map chatbot? lista))) 1)
                           (eq? (car (remove-duplicates(map chatbot? lista))) #t))))


                             









                         


