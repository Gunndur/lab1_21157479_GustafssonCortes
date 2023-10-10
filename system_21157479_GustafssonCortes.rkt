#lang racket
(require "option_21157479_GustafssonCortes.rkt")
(require "flow_21157479_GustafssonCortes.rkt")
(require "chatbot_21157479_GustafssonCortes.rkt")
(require "user_21157479_GustafssonCortes.rkt")
(provide (all-defined-out))

                     ;-- Implementación TDA system --

#|REPRESENTACIÓN:
Este TDA representa un sistema, que consiste un nombre de tipo string, un id del chatbot inicializado en el sistema de tipo entero positivo,
una lista de chatbots, donde cada chatbot es de tipo chatbot, también consiste en una lista de usuarios donde cada elemento es de tipo user
y un historial del chat de tipo chatHistory, con su correspondiente hora.
|#

#|CONSTRUCTORES:|#

;en main

#|SELECTORES|#
(define SYSTEM-name car);Selecciona el nombre del sistema.
(define SYSTEM-InitialChatbotCodeLink cadr) ;Selecciona el id del chatbot inicializado en el sistema correspondiente.
(define SYSTEM-chatbot caddr) ;Selecciona el o los chatbot pertenecientes al sistema.
(define SYSTEM-user cadddr) ;Selecciona el o los usuarios en el sistema.
(define SYSTEM-chatHistory (lambda (chatbot) (car (cdr (cdr (cdr (cdr chatbot)))))));Selecciona el o los historiales del chat del systema.

#|MODIFICADORES|#

;en main

#|OTRAS OPERACIONES|#

(define system-inválido null);Define cuando un sistema es invalido.

#|PERTENENCIA|#

#|
Descripción: Verifica que sea de tipo system y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#

(define system?(lambda(lista)
                 (and (= (length lista) 5)
                      (string? (SYSTEM-name lista))
                      (integer? (SYSTEM-InitialChatbotCodeLink lista)) (>= (SYSTEM-InitialChatbotCodeLink lista) 0)
                      (all-chatbot? (SYSTEM-chatbot lista)))))
#|
Descripción: Verifica que toda una lista sea de tipo system y retorna un booleano.
Dom: Lista.
Rec: Booleano.
Recurción: Ninguna.
|#
(define all-system?(lambda(lista)
                      (and (= (length(remove-duplicates(map system? lista))) 1)
                           (eq? (car (remove-duplicates(map system? lista))) #t))))