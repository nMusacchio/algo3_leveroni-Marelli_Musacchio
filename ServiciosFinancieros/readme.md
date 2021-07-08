# Servicios financieros 

## Opciones de modelado
En nuestro modelo notamos que hay código repetido entre la jerarquía de `TransferencePart` y la de `AccountTransaction`. Luego de discutirlo con Juan Burella, llegamos a la conclusión de que se podría subclasificar `TransferencePart` como una `AccountTransaction`. 
Sin embargo, cuando intentamos implementarlo, nos vimos obligados a bajar varios mensajes de `AccountTransaction` a `Deposit` y a `Withdraw`, generando nuevamente más código repetido. Esto nos parece señal de que falta una abstracción más en la jerarquía que no pudimos identificar, debido a una falta de conocimiento del dominio de problema. Si siguieramos iterando con este ejercicio, esa abstraccion probablemente se vuelva clara en algún momento.