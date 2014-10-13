# Standardization 

```
Hitchhiking (nick, date time; custo_passageiro; nome_origem; nome_destino; nick_condutor; enrollment)
```


```
(matriculation)+
-> enrolls nick_condutor 
________________________ 
-> enrolls nick_condutor 
(nick; abstime) + 
nick; abstime -> custo_passageiro 
nick; abstime -> nome_origem 
nick; abstime -> nick_condutor 
nick; abstime enrolls -> 
________________________________________________________________ 
nick; abstime -> custo_passageiro; nome_origem; nick_condutor; enrollment
```


As there is dependency between non-key attributes of Hitchhiking, so is not in third normal form or 
in the following. However, like all his attributes are scalar values ​​(each column has only one 
value per tuple) and like any non-key attribute (custo_passageiro, nome_origem, and nick_condutor 
enrollment) depends on all primary key attributes (nick and abstime) then is in Form 
Normal 2 (hence the Normal Form 1). 

```
Vehicle (registration, brand, model, maxocupantes; nick)
```

```
(model)+
brand model -> 
________________________ 
brand model -> 
(matriculation) + 
registration mark -> 
enrollment model -> 
-> enrolls max_ocupantes 
nick enrolls -> 
________________________________________________________________ 
-> custo_passageiro enrollment; nome_origem; nick_condutor; enrollment
```


Car is in 1st Normal Form, since all its attributes are scalar values ​​(each column only 
has a value tuple). Moreover, as any non-key attribute (brand, model, 
max_ocupantes, nick) depends on all primary key attributes (enrollment), then, is in Form 
Normal 2 However, there is no dependency between attributes of Car key, therefore, is not in the 3rd 
Normal Form or the following.
