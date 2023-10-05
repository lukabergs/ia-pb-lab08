with Laboratorio08, Ada.Text_Io, Ada.Integer_Text_Io;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
use Laboratorio08, Ada.Text_Io, Ada.Integer_Text_Io;
procedure Lab08_Pruebas is
   F: T_Fecha;
   C: T_Complejo_Polar;
   T: T_Complejo_Tri;
   L,L2:T_Lista_Estatica;
   I, Fila, Columna,Max:Integer;
   M:T_Matriz(1..5,1..5);
begin
   Put_Line("Algunas secciones del codigo han sido comentadas para reducir la carga en la consola.");
   new_line(2);
   -------------------
   -- Dia_Siguiente --
   -------------------

   new_line(3);
   Put_Line("***** Dia_Siguiente *****");
   new_line;

   -- Caso 1: Fecha normal
   F:= (4, Enero, 1972);
   Put_Line("El siguiente dia al 4 de enero del 1972 es el 5 de enero del 1972");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 2: Cambio de mes
   F:= (31, Agosto, 2010);
   Put_Line("El siguiente dia al 31 de agosto del 2010 es el 1 de septiembre del 2010");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 3: Cambio de mes (mes de 30 dias)
   F:= (30, Abril, 2013);
   Put_Line("El siguiente dia al 30 de Abril del 2013 es el 1 de Mayo del 2013");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 4: Cambio de anno
   F:= (31, Diciembre, 2017);
   Put_Line("El siguiente dia al 31 de Diciembre del 2017 es el 1 de Enero del 2018");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 5: 28 de febrero de anno no bisiesto
   F:= (28, Febrero, 2019);
   Put_Line("El siguiente dia al 28 de Febrero del 2019 es el 1 de Marzo del 2019");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 6: 28 de febrero de anno bisiesto
   F:= (28, Febrero, 2020);
   Put_Line("El siguiente dia al 28 de Febrero del 2020 es el 29 de Febrero del 2020");
   Dia_Siguiente(F);
   Put_Line(F.Dia'Img & " de " & F.Mes'Img & " del " & F.Anno'Img);

  ------------
  -- Trigon --
  ------------

   new_line(3);
   Put_Line("***** Trigon *****");
   new_line;

   -- Caso 1
   C:= (0.0,0.0);
   Put_Line("Numero en forma polar (0.0, 0.0) a forma trigonometrica: (0.0, 0.0)");
   T := Trigon(C); Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);

   new_line(2);

   -- Caso 2
   C:= (23.45, 62.91);
   Put_Line("Numero en forma polar (23.45, 62.91) a forma trigonometrica: (23.38, 1.83)");
   T := Trigon(C);
   Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);

   new_line(2);

   -- Caso 3
   C:= (99.99, 1.11);
   Put_Line("Numero en forma polar (99.99, 1.11) a forma trigonometrica: (44.46, 89.56)");
   T := Trigon(C); Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);

   -----------
   -- Polar --
   -----------

   new_line(3);
   Put_Line("***** Polar *****");
   new_line;

   T.A:= 3.45;
   T.B:= 5.43;
   C:= Polar(T);
   Put("El polar de 3.45 y 5.43 es ");
   put("Modulo:");
   Put(C.Modulo, 1, 2, 0); put(" y ");
   put("Argumento:");
   Put(C.Argumento, 1, 2, 0);
   New_Line;
   New_Line;

   T.A:= 23.38;
   T.B:= 1.83;
   C:= Polar(T);
   Put("El polar de 23.38 y 1.83 es ");
   put("Modulo:");
   Put(C.Modulo, 1, 2, 0); put(" y ");
   put("Argumento:");
   Put(C.Argumento, 1, 2, 0);
   New_Line;
   New_Line;

   T.A:= 0.0;
   T.B:= 0.0;
   C:= Polar(T);
   Put("El polar de 0.0 y 0.0 es ");
   put("Modulo:");
   Put(C.Modulo, 1, 2, 0); put(" y ");
   put("Argumento:");
   Put(C.Argumento, 1, 2, 0);
   New_Line;
   New_Line;

   T.A:= 44.46;
   T.B:= 89.56;
   C:= Polar(T);
   Put("El polar de 44.46 y 89.56 es ");
   put("Modulo:");
   Put(C.Modulo, 1, 2, 0); put(" y ");
   put("Argumento:");
   Put(C.Argumento, 1, 2, 0);
   New_Line;
   New_Line;

  --------------------
       -- esta --
  --------------------

   new_line(3);
   Put_Line("***** Esta *****");
   new_line;

   L.cont:= 0;
   L.Dato:= (0,1,2,3,4,5,6,7,8,9,others => Integer'First);
   Put("Esta 12 en el vector (0 1 2 3 4 5 6 7 8 9) ");
   put(esta(L, 12)'Img);
   New_Line;
   New_Line;

   --------------
   -- posicion --
   --------------
   L.cont:= 10;
   L.Dato:= (-3,1,2,3,4,5,6,7,8,9, others => Integer'first);
   Put("Posicion de 9 en el vector (-3 1 2 3 4 5 6 7 8 9) = 10");
   put(posicion(L, 9));
   New_Line;
   New_Line;

   L.cont:= 10;
   L.Dato:= (-3,1,2,3,4,5,6,7,8,9,10, others => Integer'first);
   Put("Posicion de 10 en el vector (-3 1 2 3 4 5 6 7 8 9) = N/A");
   put(posicion(L, 10));
   New_Line;
   New_Line;

   L.cont:= 0;
   L.Dato:= (-3,4,2,3,4,5,6,7,8,9, others => Integer'first);
   Put("Posicion de -3 en el vector () = N/A");
   put(posicion(L, -3));
   New_Line;
   New_Line;

   L.cont:= 1;
   L.Dato:= (-3,4,2,3,4,5,6,7,8,9, others => Integer'first);
   Put("Posicion de -3 en el vector (-3) = 1");
   put(posicion(L, -3));
   New_Line;
   New_Line;

   L.cont:= 1;
   L.Dato:= (-3,4,2,3,4,5,6,7,8, others => Integer'first);
   Put("Posicion de 4 en el vector (-3) = N/A");
   put(posicion(L, 4));
   New_Line;
   New_Line;

   L.cont:= Max_Valores;
   L.Dato:= (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
   Put("Posicion de 20 en el vector (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20) = 20");
   put(posicion(L, 20));
   New_Line;
   New_Line;

   L.cont:= Max_Valores;
   L.Dato:= (-3,1,2,3,4,5,6,7,8,9, others => Integer'first);
   Put("Posicion de Int'First en el vector (-3 1 2 3 4 5 6 7 8 9 Int'First...Int'First) = 11");
   put(posicion(L, Integer'First));
   New_Line;
   New_Line;



   -----------------
   -- Son_Iguales --
   -----------------
   L2.cont:= 0;
   L2.Dato:= (0,1,2,3,4,5,6,7,8,9,others => Integer'First);
   Put("Los vectores (0 1 2 3 4 5 6 7 8 9) y (0 1 2 3 4 5 6 7 8 9) son iguales ");
   Put(Son_Iguales(L, L2)'Img);
   New_Line;
   New_Line;


   -----------------------
   -- eliminar_elemento --
   -----------------------
   Put("El vector (0 1 2 3 4 5 6 7 8 9) sin el 3 es (0 1 2 4 5 6 7 8 9)");
   L.Dato:= (0,1,2,3,4,5,6,7,8,9,others => Integer'First);
   L.cont:= 10;
   eliminar_elemento(3,L);
   I:= L.Dato'First;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (0 0 0 0 0 0 0 0 0 0) sin el 0 es ()");
   L2.Dato:= (0,0,0,0,0,0,0,0,0,0,others => Integer'First);
   L2.cont:= 10;
   eliminar_elemento(0,L2);
   I:= L2.Dato'First;
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector () sin el 0 es ()");
   L2.Dato:= (0,0,0,0,0,0,0,0,0,0,others => Integer'First);
   L2.cont:= 0;
   eliminar_elemento(0,L2);
   I:= L2.Dato'First;
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector () sin el Int'First es ()");
   L2.Dato:= (others => Integer'First);
   L2.cont:= 0;
   eliminar_elemento(Integer'First,L2);
   I:= L2.Dato'First;
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (Int'First..Int'First) sin el Int'First es ()");
   L2.Dato:= (others => Integer'First);
   L2.cont:= Max_Valores;
   eliminar_elemento(Integer'First,L2);
   I:= L2.Dato'First;
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (1 2 1 1 5 1 7 1 9) sin el 1 es (2 5 7 9)");
   L2.Dato:= (1,2,1,1,5,1,7,1,9,others => Integer'First);
   L2.cont:= 9;
   eliminar_elemento(1,L2);
   I:= L2.Dato'First;
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------
   Put("El vector (1 2 3 4 5 7 8 9 0) con un 6 en la posicion 23 es (1 2 3 4 5 7 8 9 0)");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 9;
   insertar_elemento_en_pos(6,23,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector () con un 6 en la posicion 6 es ()");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 0;
   insertar_elemento_en_pos(6,6,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (1 2 3 4 5 7 8 9 0) con un 6 en la posicion 10 es (1 2 3 4 5 7 8 9 0 6)");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 9;
   insertar_elemento_en_pos(6,10,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector () con un 5 en la posicion 1 es (5)");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 0;
   insertar_elemento_en_pos(5,1,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (1) con un 2 en la posicion 1 es (2 1)");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 1;
   insertar_elemento_en_pos(2,1,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (1) con un 2 en la posicion 2 es (1 2)");
   L.Dato:= (1,2,3,4,5,7,8,9,0,others => Integer'First);
   L.cont:= 1;
   insertar_elemento_en_pos(2,2,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;

   Put("El vector (2..2) con un 1 en la posicion 1 es (1 2..2)");
   L.Dato:= (others => 2);
   L.cont:= Max_Valores - 1;
   insertar_elemento_en_pos(1,1,L);
   I:= L.Dato'First; new_line;
   while I <= L.cont loop
      Put(L.Dato(I));
      I:= I+1;
   end loop;
   New_Line;
   New_Line;


   ----------------
   -- Pos_Maximo --
   ----------------
   L2.Dato:= (1,2,3,4,5,6,7,8,9,0,others => Integer'First);
   L2.cont:= 0;
   Put("El maximo de (1 2 3 4 5 7 8 9 0) es ");
   Put(Pos_Maximo(L2)'Img);
   New_Line;
   New_Line;


   ---------------------
   -- Ordenar_Burbuja --
   ---------------------
   Ordenar_Burbuja(L2);
   I:= L2.Dato'First;
   Put_line("El vector (1 2 3 4 5 7 8 9 0) ordenado es ");
   while I <= L2.cont loop
      Put(L2.Dato(I));
      I:= I+1;
   end loop;
   new_line;
   new_line;

   --------------
   -- Posicion --
   --------------

   M := ((1,2,3,4,5),
         (1,2,others => 0),
         (1 => 4, 3 => 8, 5 => 9, others => 0),
         others => (others => 0));
   Posicion(M,7,Fila,Columna);
   Put("La primera posicion del 7 en la matriz: ");
   new_line;
   for i in M'Range(1) loop
      for j in M'Range(2) loop
         Put(M(i,j));
      end loop;
      new_line;
   end loop;
   new_line;
   put("esta en la fila ");put(Fila, Width => 1);put(", columna ");put(Columna, Width => 1);
   new_line;
   new_line;

   ------------
   -- Maximo --
   ------------
   Put("El maximo y su posicion en la matriz ");
   new_line;
   for i in M'Range(1) loop
      for j in M'Range(2) loop
         Put(M(i,j));
      end loop;
      new_line;
   end loop;
   new_line;
   Maximo(M,Max,Fila,Columna);put("es ");put(Max, Width => 1);put(" y ");put("esta en la fila ");put(Fila, Width => 1);put(", columna ");put(Columna, Width => 1);
   new_line;
   new_line;

   M := ((99, 1, 2, 3, 4),
         ( 5, 6, 7, 8, 9),
         (10,11,12,13,14),
         (15,16,17,18,19),
         (20,21,22,23,24));

   Put("El maximo y su posicion en la matriz ");
   new_line;
   for i in M'Range(1) loop
      for j in M'Range(2) loop
         Put(M(i,j));
      end loop;
      new_line;
   end loop;
   new_line;
   Maximo(M,Max,Fila,Columna);put("es ");put(Max, Width => 1);put(" y ");put("esta en la fila ");put(Fila, Width => 1);put(", columna ");put(Columna, Width => 1);
   new_line;
   new_line;

   M := ((99, 1, 2, 3, 4),
         ( 5, 6, 7, 8, 9),
         (10,11,12,13,14),
         (15,16,17,18,19),
         (20,21,22,23,100));

   Put("El maximo y su posicion en la matriz ");
   new_line;
   for i in M'Range(1) loop
      for j in M'Range(2) loop
         Put(M(i,j));
      end loop;
      new_line;
   end loop;
   new_line;
   Maximo(M,Max,Fila,Columna);put("es ");put(Max, Width => 1);put(" y ");put("esta en la fila ");put(Fila, Width => 1);put(", columna ");put(Columna, Width => 1);
   new_line;
   new_line;


end Lab08_Pruebas;

