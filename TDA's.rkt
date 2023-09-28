#lang racket

; TDA's minimas:
; option, flow, chatbot, system, user, chatHistory.

; TDA's: (15 en total)
; option, flow, flow-add-option, chatbot, chatbot-add-flow, system, system-add-chatbot, system-add-user,
; system-login, system-logout, system-talk-rec, system-talk-norec, system-synthesis, system-simulate.

#|------------------------------------------------------------------------------------------------------|#

;-- TDA option --

#|REPRESENTACIÓN:

Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, esto es para 

|#

#|CONSTRUCTORES:|#
;Dom: code(int) x message(string) x ChatbotCodeLink(int) x InitialFlowCodeLink(int) x Keyword* (en referencia a 0 o más palabras claves).
;Rec: option.
;Descripción: Crea opciones a escoger.
;Recursividad:

(define option(lambda(code message ChatbotCodeLink InitialFlowCodeLink Keyword*)
                (if (and (integer? code) (>= code 0)
                         (string? message)
                         (integer? ChatbotCodeLink) (>= ChatbotCodeLink 0)
                         (integer? InitialFlowCodeLink) (>= InitialFlowCodeLink 0)
                         (string? Keyword)) ;AAAAAAAAAAAA
                    (list code message ChatbotCodeLink InitialFlowCodeLink Keyword*)
                    option-invalido)))
                
#|SELECTORES|#

;Opciones invalidas                    
(define option-invalido null)

;Opciones invalidas?
(define option-invalido? null?)
                    
#|MODIFICADORES|#
                
#|OTRAS OPERACIONES|#

                    
#|PERTENENCIA (NO OBLIGATORIO)|#

;Dom: No tiene.
;Rec: Booleano.
;Descripción: Verifica que sea un tipo option y retorna un booleano.
;Recurción: Ninguna.                  
(define option?(lambda(a)
                 (and(list? a)
                     (= (lenght a) 5)
                     (...)




         
;-- TDA flow --

;Dominio:
;Recorrido:
;Descripción: