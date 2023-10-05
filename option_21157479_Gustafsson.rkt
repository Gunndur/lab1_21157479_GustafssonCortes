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

;Dom: Lista.
;Rec: Booleano.
;Descripción: Funcion para verificar si es un Keyword.
;Recurción: Ninguna.
(define Keyword?(lambda(lista)
                  (and(= (length(remove-duplicates(map string? lista))) 1)
                          (eq? (car(remove-duplicates(map string? lista))) #t))))
                    
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





