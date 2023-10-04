#lang racket
(provide (all-defined-out))


#|------------------------------------------------------------------------------------------------------|#

; TDA's minimas:
; option, flow, chatbot, system, user, chatHistory.

; TDA's: (15 en total)
; option, flow, flow-add-option, chatbot, chatbot-add-flow, system, system-add-chatbot, system-add-user,
; system-login, system-logout, system-talk-rec, system-talk-norec, system-synthesis, system-simulate.

#|------------------------------------------------------------------------------------------------------|#





                     ;-- Implementación TDA option --

#|REPRESENTACIÓN:
Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, esto es para
|#

#|CONSTRUCTORES:|#
;Dom: code(int) x message(string) x ChatbotCodeLink(int) x InitialFlowCodeLink(int) x Keyword* (en referencia a 0 o más palabras claves).
;Rec: option.
;Descripción: Crea opciones a escoger.
;Recursividad: ---

(define option(lambda(code message ChatbotCodeLink InitialFlowCodeLink . Keyword)
                (if (and (integer? code) (>= code 0)
                         (string? message)
                         (integer? ChatbotCodeLink) (>= ChatbotCodeLink 0)
                         (integer? InitialFlowCodeLink) (>= InitialFlowCodeLink 0)
                         (Keyword? Keyword))
                    (list code message ChatbotCodeLink InitialFlowCodeLink Keyword)
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

#|(define option?(lambda(a)
                 (and(list? a)
                     (= (lenght a) 5)
                     (...)|#


(define Keyword?(lambda(L)
                  (define keyword?(lambda(L1 n)
                                    (if (


                     
                     
                     ;-- Implementación TDA flow --

#|CONSTRUCTORES:|#                    
;Dominio: id(int) x name-msg(String) x Option*(Indica que puede recibir cero o más opciones).
;Recorrido: flow.
;Descripción: Funcion que construye un flujo de un chatbot y verifica que las opciones creadas no se repitan.
;Recursividad: ---

#|SELECTORES|#

;Opciones invalidas                    
;Opciones invalidas?
                    
#|MODIFICADORES|#
                
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