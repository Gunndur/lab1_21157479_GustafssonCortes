#lang racket

(require "option_21157479_GustafssonCortes.rkt")
(require "flow_21157479_GustafssonCortes.rkt")
(require "chatbot_21157479_GustafssonCortes.rkt")
(require "system_21157479_GustafssonCortes.rkt")
(require "user_21157479_GustafssonCortes.rkt")
(require "chatHistory_21157479_GustafssonCortes.rkt")
(provide (all-defined-out))

#|
2)option.
Descripción: Crea opciones a escoger, esta construye una opción para un flujo de un chatbot, siendo estos
unicos mediante su propio id. Cada opción se une a un chatbot y un flujo específicos.
Dom: code(int) x message(string) x ChatbotCodeLink(int) x InitialFlowCodeLink(int) x Keyword.
Rec: option.
Recursividad: Nula.
|#

(define option(lambda(code message ChatbotCodeLink InitialFlowCodeLink . Keyword)
                (if (and (integer? code) (>= code 0)
                         (string? message)
                         (integer? ChatbotCodeLink) (>= ChatbotCodeLink 0)
                         (integer? InitialFlowCodeLink) (>= InitialFlowCodeLink 0)
                         (Keyword? Keyword))
                    (list code message ChatbotCodeLink InitialFlowCodeLink Keyword)
                    option-inválido)))
#|
3)flow.
Descripción: Funcion que construye un flujo de un chatbot identificado mediante su id y verifica que las opciones creadas no se repitan.
Dominio: id(int) x name-msg(String) x option.
Recorrido: flow.
Recursividad: Nula.
|#

(define flow(lambda( id name-msg . option)
              (if (and (integer? id) (>= id 0)
                         (string? name-msg)
                         (list? option)
                         (all-option? option))
                  (crear id name-msg (remove-duplicates option))
                  flow-inválido)))
#|
4)flow-add-option.
Descripción: Modifica un flujo para poder añadirle una nueva opción, pero primero verifica que no esté repetida mediante su id,
si está repetida la opción, no es agregada y se mantiene el flujo inicial.
Dominio: flow x option.
Recorrido: flow.
Recursividad: Nula.
|#

(define flow-add-option(lambda(flow option)
                         (if (and (flow? flow)
                                  (option? option)
                                  (eq? (member (OP-code option) (map OP-code (FLOW-option flow))) #f))
                             (unir (FLOW-id flow) (unir (FLOW-name-msg flow)  (unir (FLOW-option flow) (crear option))))
                             flow)))
#|
5)chatbot.
Descripción: Función que crea un chatbot con un id único, también verifica que no haya flujos repetidos en el nuevo chatbot,
esto es verificado por medio del id de los flujos.
Dominio: chatbotID(int) x name(String) x welcomeMessage(String) x startFlowId(int) x  flows
Recorrido: chatbot.
Recursividad: ----
|#

(define chatbot(lambda(chatbotID name welcomeMessage startFlowId . flows)
                 (if (and (integer? chatbotID) (>= chatbotID 0)
                          (string? name)
                          (string? welcomeMessage)
                          (integer? startFlowId) (>= startFlowId 0)
                          (all-flow? flows))
                     (crear chatbotID name welcomeMessage startFlowId (remove-duplicates flows))
                     chatbot-inválido)))
#|
6)chatbot-add-flow.
Descripción: Añade un nuevo flujo a un chatbot, verificando que esté no se repita, esto se valida mediante el id del flujo, si es así, no se añade
y se mantiene el chatbot inicial. Añadir que se debe implementar un tipo de recursión, en este caso se usó la recursión natural.
Dominio: chatbot x flow.
Recorrido: chatbot.
Recursividad: Natural.
|#

(define chatbot-add-flow(lambda(chatbot flow)
                          (define fn(lambda(fls fl)
                                      (if (null? fls)
                                          fl
                                          (if (= (FLOW-id (frente fls)) (FLOW-id fl))
                                              fls
                                              (unir (frente fls) (fn (resto fls) fl))))))         
                          (unir (CHATBOT-chatbotID chatbot) (unir (CHATBOT-name chatbot) (unir (CHATBOT-welcomeMessage chatbot) (unir (CHATBOT-startFlowId chatbot) (fn (CHATBOT-flows chatbot) flow)))))))
#|
7)system.
Descripción: Función que construye un sistema de chatbots y deja registro de la fecha y hora de la creación. Este también contiene el historial del chat de cada usuario,
donde este mismo lo puede visualizar cuando lo desee.

Dominio: name(string) x InitialChatbotCodeLink(Int) x chatbot*.
Recorrido: system.
Recursividad: Nula.
|#

(define system(lambda(name InitialChatbotCodeLink . chatbot)
                (if (and (string? name)
                         (integer? InitialChatbotCodeLink) (>= InitialChatbotCodeLink 0)
                         (all-chatbot? chatbot))
                         (crear name InitialChatbotCodeLink (remove-duplicates chatbot) (crear null) (crear null))
                         system-inválido)))
#|
8)system-add-chatbot.
Descripción: Función que añade un nuevo chatbot a la lista de chatbots de un sistema en específico, pero primero verifica que este nuevo chatbot,
por medio de su id, no se repita. Si está repetido, se mantiene el sistema inicial sin cambios.

Dominio: system x chatbot.
Recorrido: system.
Recursividad: Nula.
|#

(define system-add-chatbot(lambda(system chatbot)
                            (if (and (system? system)
                                     (chatbot? chatbot)
                                     (eq? (member (CHATBOT-chatbotID chatbot) (map CHATBOT-chatbotID (SYSTEM-chatbot system))) #f))
                                (unir (unir (unir (SYSTEM-name system) (unir (SYSTEM-InitialChatbotCodeLink system) (juntar (SYSTEM-chatbot system) (crear chatbot)))) SYSTEM-user system) SYSTEM-chatHistory system)
                                system)))
#|
9)system-add-user.
Descripción: Añade un nuevo usuario al sistema, verificando que no se repita su nombre en otros usuarios, ya que si es así, no será agregado a al sistema.
Dominio: system x user (string).
Recorrido: system.
Recursividad: Nula.
|#

(define system-add-user(lambda(system usuario)
                         (if (and (system? system)
                                  (user? usuario)
                                  (eq? (member usuario (SYSTEM-user system)) #f))
                             (crear (SYSTEM-name system) (SYSTEM-InitialChatbotCodeLink system) (SYSTEM-chatbot system) (juntar (SYSTEM-user system) (crear usuario)) (SYSTEM-chatHistory system))
                             system)))
#|
10)system-login.
Descripción: Hace iniciar al usuario de sesión en el sistema, pero primero se comprueba que no esté "conectado", que no haya nadie con su misma id (su nombre)
o que no existe una sesión ya iniciada por otro usuario.
Dominio: system x user (string).
Recorrido: system.
Recursividad: Nula.
|#

#|
11)system-logout.
Descripción: Permite cerrar la sesión abierta anteriormente por un mismo usuario.
Dominio: system.
Recorrido: system.
Recursividad: Nula.
|#

#|
12)system-talk-rec.
Descripción: Función que permite al usuario interactuar con el chatbot, revisando previamente que el usuario haya iniciado sesión.
Dominio: system x message (string).
Recorrido: system.
Recursividad: Cola.
|#

#|
13)system-talk-norec.
Descripción: Función que permite lo mismo que la función anterior system-talk-rec pero es implementada de forma declarativa.
Dominio: system x message (string).
Recorrido: system.
Recursividad: Nula.
|#

#|
14)system-synthesis
Descripción: Entrega una síntesis del chatbot o los chatbots para un usuario en particular a partir de chatHistory que está en el respectivo sistema.
Dominio: system x usuario (string).
Recorrido: String.
Recursividad: Nula.
|#

#|
15)system-simulate
Descripción: Permite que exista una simulación de interacción entre dos chatbots. De forma pseudoaleatoria, se da la posibilidad de que interactuen de forma “realista”,
si no hay más interacciones, la simulación termina, esto es al igual con la cota superior, que es el número máximo de interacciones. 
Dominio: system x maxInteractions (int) x seed (int).
Recorrido: system.
Recursividad: Nula.
|#
















