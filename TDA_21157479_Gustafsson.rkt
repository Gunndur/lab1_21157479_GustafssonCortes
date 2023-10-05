#lang racket

(provide (all-defined-out))


#|------------------------------------------------------------------------------------------------------|#

; TDA's minimas:
; option, flow, chatbot, system, user, chatHistory.

; TDA's: (15 en total)
; option, flow, flow-add-option, chatbot, chatbot-add-flow, system, system-add-chatbot, system-add-user,
; system-login, system-logout, system-talk-rec, system-talk-norec, system-synthesis, system-simulate.

#|------------------------------------------------------------------------------------------------------|#



                     ;-- Funciones varias --

;Funcion para verificar si es un Keyword
(define Keyword?(lambda(lista)
                  (and(= (length(remove-duplicates(map string? lista))) 1)
                          (eq? (car(remove-duplicates(map string? lista))) #t))))






                     ;-- Implementación TDA option --

#|REPRESENTACIÓN:
Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, esto es para
|#

;Opciones invalidas                    
(define option-inválido null);Define cuando la opción es invalida.


#|CONSTRUCTORES:|#

;Dom: code(int) x message(string) x ChatbotCodeLink(int) x InitialFlowCodeLink(int) x Keyword.
;Rec: option.
;Descripción: Crea opciones a escoger.
;Recursividad: Nula.

(define option(lambda(code message ChatbotCodeLink InitialFlowCodeLink . Keyword)
                (if (and (integer? code) (>= code 0)
                         (string? message)
                         (integer? ChatbotCodeLink) (>= ChatbotCodeLink 0)
                         (integer? InitialFlowCodeLink) (>= InitialFlowCodeLink 0)
                         (Keyword? Keyword))
                    (list code message ChatbotCodeLink InitialFlowCodeLink Keyword)
                    option-inválido)))

#|SELECTORES|#

(define OP-code car);Selecciona el codigo ("id") del option.
(define OP-message cadr) ;Selecciona el mensaje del option.
(define OP-ChatbotCodeLink caddr) ;Selecciona el codigo del link del chatbot asociado al option.
(define OP-InitialFlowCodeLink cadddr) ; Selecciona el codigo del link del flow inicial del option.
(define OP-Keyword (lambda (n) (car (cddddr n)))) ;Selecciona el y/o las palabras claves asociadas con el option.
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#

;Dom: Cualquier cosa.
;Rec: Booleano.
;Descripción: Verifica que sea un tipo option y retorna un booleano.
;Recurción: Ninguna.                  

(define option?(lambda(option)
                (and (= (length option) 5)
                     (integer? (OP-code option)) (>= (OP-code option) 0)
                     (string? (OP-message option))
                     (integer? (OP-ChatbotCodeLink option)) (>= (OP-ChatbotCodeLink option) 0)
                     (integer? (OP-InitialFlowCodeLink option)) (>= (OP-InitialFlowCodeLink option) 0)
                     (Keyword? (OP-Keyword option)))))

;Dom: Lista.
;Rec: Booleano.
;Descripción: Verifica que toda una lista sea de tipo option y retorna un booleano.
;Recurción: Ninguna.
(define all-option?(lambda(list)
                     (and(= (length(remove-duplicates(map option? list))) 1)
                         (eq? (car(remove-duplicates(map option? list))) #t))))






                     
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
                  (list id name-msg option)
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

(define flow-add-option(lambda(flow . option)
                         (









                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#








                     

                     ;-- Implementación TDA flow-add-option --
                     
#|CONSTRUCTORES:|#
;Dominio: flow x option.
;Recorrido: flow.
;Descripción: Añade más flujos y verifica que no se repitan.
;Recursividad: No posee.

#|SELECTORES|#

;Opciones invalidas                    
;Opciones invalidas?
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#







                     

                     ;-- Implementación TDA chatbot --

#|CONSTRUCTORES:|#                     
;Dominio: chatbotID(int) x name(String) x welcomeMessage(String) x startFlowId(int) x  flows*(indicando que puede recibir 0 o más flujos).
;Recorrido: chatbot.
;Descripción: Construye un chatbot y verifica que no se repita.
;Recursividad: ----

#|SELECTORES|#

;Opciones invalidas                    
;Opciones invalidas?
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#








                     

                     
                        ;-- Implementación TDA chatbot-add-flow --

#|CONSTRUCTORES:|#                     
;Dominio: chatbot x flow.
;Recorrido: chatbot.
;Descripción: Añade un flujo a un chatbot y verifica que no se repita.
;Recursividad: ----

#|SELECTORES|#

;Opciones invalidas                    
;Opciones invalidas?
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#






                     

                        ;-- Implementación TDA system --

#|CONSTRUCTORES:|#                     
;Dominio: name(string) x InitialChatbotCodeLink(Int) x chatbot*(indicando que pueden recibir 0 o más chatbots).
;Recorrido: system.
;Descripción: Crea un sistema de chatbots y deja un registro de la fecha de creación.
;Recursividad: ----

#|SELECTORES|#

;Opciones invalidas                    
;Opciones invalidas?
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#                     
