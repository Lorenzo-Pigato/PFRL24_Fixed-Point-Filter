# readme.md

# Filtro esponenziale fixed-point - Voto 27/30

Si progetti un circuito sequenziale per la realizzazione di un filtro esponenziale del secondo ordine. Il sistema riceve una sequenza continua di campioni 𝑋𝑡 rappresentati in virgola fissa su 32 bit in cui 16 bit rappresentano la parte frazionaria e produce in uscita il segnale filtrato 𝑌𝑡 rappresentato con la stessa notazione e calcolato come:

$$
𝑌_𝑡 = 𝛼𝑋_𝑡 + 𝛼(1 − 𝛼)𝑌_{t-1} + (1 − 𝛼)^2 𝑌_{𝑡−1}
$$

Per semplicità si limita il coefficiente del filtro α alle potenze negative del 2, cioè:

$$
𝛼 = \frac{1}{2𝑘}
$$

In questo modo il calcolo dei coefficienti 𝛼, 𝛼(1 − 𝛼) e $(1 − 𝛼)^2$ risulta notevolmente semplificato
IL valore 𝑘 viene fornito in ingresso al sistema e si suppone costante durante l’elaborazione di una sequenza di ingressi.

Data la precisione della rappresentazione di ingresso, si limita il valore di 𝑘 all’intervallo [0; 7]. Il
comportamento del filtro non è definito se il coefficiente 𝛼 viene cambiato durante la normale operatività del filtro. 

Il sistema deve altresì disporre di un segnale di “inizializzazione” che riporta lo stato del filtro a zero.
Una volta realizzato il componente, è richiesto di realizzare un test-bench per la simulazione e la verifica del corretto funzionamento nei diversi casi. In particolare, è necessario verificare il comportamento del filtro rispetto alla risposta al gradino. La simulazione deve tenere conto dei ritardi reali del sistema (simulazione Post Place & Route).

NOTA: la specifica è incorretta, l'equazione fornita equivale a quella di un filtro del primo ordine, appare chiaro sviluppando il termine al quadrato e semplificando, come riportato nella relazione.
L'errore è stato corretto dal professore in seguito alla consegna di questo progetto.
