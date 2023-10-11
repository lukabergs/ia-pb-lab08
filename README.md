# LABORATORIO 08
## Matrices, registros y Listas estáticas
### TAREA 1. Ejercicios obligatorios
1. **Día siguiente.** Implementa el _procedimiento_ **dia_siguiente** que, dada una fecha, la modifique y devuelva la fecha correspondiente al día siguiente. El programa debe tener en cuenta el número de días que tiene cada mes incluyendo los años bisiestos. Un año bisiesto es aquel que es divisible entre 4, salvo que sea secular (el último de cada siglo, que termina en 00), aunque los seculares que son divisibles entre 400 sí son bisiestos.
2. **Polar a trigonométrica.** Implementa la _función_ **trigon** que, dado un número complejo en formato polar, nos devuelve el mismo número complejo en forma trigonométrica según las fórmulas que aparecen más abajo. En Ada existe la biblioteca _Ada.Numerics.Elementary_Functions_ que ofrece el seno ($\sin$), el coseno ($\cos$).
  ```math
  \begin{align}
    b = modulo \sin(argumento) \
    a = modulo \cos(argumento)
  \end{align}
  ```
3. **Trigonométrica a polar.** Implementa la _función_ **polar** que, dado un número complejo en formato trigonométrico, nos devuelve el mismo número complejo en forma polar. Para definir exactamente el ángulo, hace falta estudiar el signo de a y b y determinar el cuadrante en el que se encuentra (como si fuera una coordenada en el plano). En Ada existe la biblioteca _Ada.Numerics.Elementary_Functions_ que ofrece la arcotangente ($\arctan$).
  ```math
    \begin{equation*}
      modulo = \left|\sqrt{a^2 + b^2}\right| \qquad
      argumento = \begin{cases}
        \arctan\left(\frac{b}{a}\right) & \text{si } a > 0 \text{ y } b > 0 \
        2\pi + \arctan\left(\frac{b}{a}\right) & \text{si } a > 0 \text{ y } b < 0 \
        \pi + \arctan\left(\frac{b}{a}\right) & \text{si } a < 0 \
        \frac{\pi}{2} & \text{si } a = 0 \text{ y } b > 0 \
        \frac{3\pi}{2} & \text{si } a = 0 \text{ y } b < 0 \
        0 & \text{si } a = 0 \text{ y } b = 0
       \end{cases}
    \end{equation*}
  ```
4. **¿Está en lista estática?** Implementa la _función_ **esta** que, dado un valor entero N y una lista estática con valores que pueden no estar ordenados, diga si el entero está o no en el vector.
5. **Posición (lista estática).** Implementa la _función_ **posicion** que, dado un valor entero X y una lista estática cuyos valores pueden no estar ordenados, diga en qué posición se encuentra X en el vector. Si dicho entero estuviera repetido, bastará con devolver la posición de la primera de sus apariciones; y en caso de no encontrarse en el vector, se devolverá el valor Integer’Last.
6. **¿Son iguales? (lista estática).** Implementa la _función_ **son_iguales** que, dadas dos listas estáticas, devuelva true si el contenido de las dos listas es el mismo (mismos elementos en el mismo orden) y false si no.
7. **Eliminar elemento (lista estática).** Crear el _procedimiento_ **eliminar_elemento** que, dado un entero num y una lista estática de enteros L, la modifique eliminando todas las apariciones del elemento num (si existe).
8. **Insertar elemento en lista estática.** Implementa el _procedimiento_ **insertar_elemento_en_pos** que, dados dos enteros num y pos, y una lista estática con espacio para un entero más, inserte en la lista el número num en la posición pos dentro de la lista, desplazando los elementos que corresponda una posición a la derecha si la posición es un número entre 1 y el numero de elementos de la lista más uno. Si la posición no está en ese rango, se ignora y se deja la lista tal y como está.
### TAREA 2. Ejercicios extra
9. **Posición del máximo (lista estática).** Implementa la _función_ **pos_maximo** que, dada una lista estática de enteros, devuelva el valor del índice en el que se encuentra el máximo de esa lista.
10. **Ordenar por método de la burbuja (lista estática).** Implementa el _procedimiento_ **ordenar_burbuja** que, dado una lista estática de enteros, ordene sus elementos de mayor a menor.
11. **Posición del un número en una matriz.** Implementa el _procedimiento_ **posicion** que, dada una matriz de N x M enteros (N>0 y M>0) y un valor entero Num, devuelva la posición en la que se encuentra Num (es decir, sus coordenadas Fila y Columna). Si el entero está repetido, se devolverá la posición de la fila más alta y, si aún así hay varios, entonces la de más a la izquierda. Si Num no está en la matriz, se devolverá como posición la fila 0 y la columna 0.
12. **Máximo elemento de una matriz.** Implementa el _procedimiento_ **maximo** que, dada una matriz de enteros de dimensiones N x M (N,M>0), calcule el valor máximo y la posición en la que se encuentra. Si el valor máximo está repetido, devolver la posición de la primera de sus apariciones en la matriz contando por filas de arriba abajo y en cada fila de izquierda a derecha (o sea, como en el ejercicio anterior).
