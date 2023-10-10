#lang racket
(require "option_21157479_GustafssonCortes.rkt")
(require "flow_21157479_GustafssonCortes.rkt")
(provide (all-defined-out))



                     ;-- Implementación TDA chatbot --


#|REPRESENTACIÓN:
Este TDA representa un chatbot, este posee un id unico tipo entero mayor que cero, un nombre de tipo string, un mensaje de presentación de tipo string,
el id del flow inicial asociado de tipo entero positivo y una lista de los flujos, donde cada uno de los flujos es de tipo flow.
|#

#|CONSTRUCTORES:|#

;en main

#|SELECTORES|#
(define CHATBOT-chatbotID car);Selecciona el id del chatbot.
(define CHATBOT-name cadr) ;Selecciona el nombre del chatbot.
(define CHATBOT-welcomeMessage caddr) ;Selecciona el mensaje de bienvenida del chatbot.
(define CHATBOT-startFlowId cadddr) ; Selecciona el id del flow inicializado en el chatbot correspondiente.
(define CHATBOT-flows (lambda (chatbot) (car (cdr (cdr (cdr (cdr chatbot))))))) ;Selecciona el y/o los flows del chatbot.
                    
                   
#|MODIFICADORES|#

;en main

#|OTRAS OPERACIONES|#
            
(define chatbot-inválido null);Define cuando un chatbot es invalido.

#|PERTENENCIA|#

#|
Descripción: Verifica que sea de tipo chatbot y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#

(define chatbot?(lambda(lista)
                  (and (= (length lista) 5)
                       (integer? (CHATBOT-chatbotID lista)) (>= (CHATBOT-chatbotID lista) 0)
                       (string? (CHATBOT-name lista))
                       (string? (CHATBOT-welcomeMessage lista))
                       (integer? (CHATBOT-startFlowId lista)) (>= (CHATBOT-startFlowId lista) 0)
                       (all-flow? (CHATBOT-flows lista)))))
                 
#|
Descripción: Verifica que toda una lista sea de tipo chatbot y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#

(define all-chatbot?(lambda(lista)
                      (and (= (length(remove-duplicates(map chatbot? lista))) 1)
                           (eq? (car (remove-duplicates(map chatbot? lista))) #t))))


                             









                         


