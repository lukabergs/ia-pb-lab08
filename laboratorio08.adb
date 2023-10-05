with Ada.Numerics, Ada.Numerics.Elementary_Functions; use Ada.Numerics, Ada.Numerics.Elementary_Functions;

package body Laboratorio08 is

   ------------------------------------------------------------
   --AUTHOR: BERGARETXE LOPEZ, LUKA
   ------------------------------------------------------------

   -------------------
   -- Dia_Siguiente --
   -------------------

   procedure Dia_Siguiente (F: in out T_Fecha) is
      dias_mes : Integer;
   begin
      if F.Mes = Febrero then
         if F.anno mod 400 = 0 or (F.anno mod 100 = 0 xor F.anno mod 4 = 0) then
            dias_mes := 29;
         else
            dias_mes := 28;
         end if;
      elsif (T_Mes'Pos(F.Mes) < 7 and T_Mes'Pos(F.Mes) mod 2 = 0) or (T_Mes'Pos(F.Mes) >= 7 and T_Mes'Pos(F.Mes) mod 2 = 1) then
         dias_mes := 31;
      else
         dias_mes := 30;
      end if;
      if F.Dia + 1 > dias_mes then
         F.Dia := 1;
         if F.Mes = Diciembre then
            F.Mes := Enero;
            F.anno := Positive'Succ(F.anno);
         else
            F.Mes := T_Mes'Succ(F.Mes);
         end if;
      else
         F.Dia := T_Dia'Succ(F.Dia);
      end if;

   end Dia_Siguiente;

   ------------
   -- Trigon --
   ------------

   function Trigon (C: in T_Complejo_Polar) return T_Complejo_Tri is
      T : T_Complejo_Tri;
   begin
      T := (C.Modulo * Cos(C.Argumento),C.Modulo * Sin(C.Argumento));
      return T;

   end Trigon;

   -----------
   -- Polar --
   -----------

   function Polar (C: in T_Complejo_tri) return T_complejo_polar is
      P : T_Complejo_Polar;
   begin
      P.Modulo := Sqrt(C.A**2 + C.B**2);
      if (C.A > 0.0 and C.B > 0.0) then
         P.Argumento := arctan(C.B/C.A);
      elsif (C.A > 0.0 and C.B < 0.0) then
         P.Argumento := 2.0 * Pi + arctan(C.B/C.A);
      elsif (C.A < 0.0) then
         P.Argumento := Pi + arctan(C.B/C.A);
      elsif (C.A = 0.0 and C.B > 0.0) then
         P.Argumento := Pi / 2.0;
      elsif (C.A = 0.0 and C.B < 0.0) then
         P.Argumento := 3.0*Pi / 2.0;
      else
         P.Argumento := 0.0;
      end if;
      return P;

   end Polar;

   ----------
   -- esta --
   ----------

   function esta (L: in T_Lista_Estatica; N: in Integer) return Boolean is
      r : Boolean := FALSE;
      i : Natural := 0;
   begin
      while not r and i < L.Cont loop
         r := r or L.Dato(L.Dato'first + i) = N;
         i := i + 1;
      end loop;
      return r;
   end esta;

   --------------
   -- posicion --
   --------------

   function posicion (L: in T_Lista_Estatica; Num: in Integer) return Integer is
      pos : Integer := Integer'Last;
      i : Natural := 0;
   begin
      if L.Cont > 0 then
         loop
            if L.Dato(L.Dato'first + i) = Num then
               pos := L.Dato'first + i;
            end if;
            i := i + 1;
            exit when L.Dato(L.Dato'first + i - 1) = Num or i >= L.Cont;
         end loop;
      end if;
      return pos;
   end posicion;

   -----------------
   -- Son_Iguales --
   -----------------

   function Son_Iguales (L1, L2: in T_Lista_Estatica) return Boolean is
      r : Boolean;
      i : Natural := 0;
   begin
      if L1.Cont /= L2.Cont then
         r := FALSE;
      else
         r := TRUE;
         if L1.Cont > 0 then
            loop
               r := r and L1.Dato(L1.Dato'first + i) = L2.Dato(L2.Dato'first + i);
               i := i + 1;
               exit when not r or i >= L1.Cont;
            end loop;
         end if;
      end if;
      return r;
   end Son_Iguales;

   -----------------------
   -- eliminar_elemento --
   -----------------------

   procedure eliminar_elemento
     (num: in Integer;
      L: in out T_Lista_Estatica)
   is
      j : Natural := 0;
   begin
      for i in 0..L.Cont-1 loop
         if L.Dato(L.Dato'First + i) /= num then
            L.Dato(L.Dato'First + j) := L.dato(L.Dato'First + i);
            j := j + 1;
         else
            L.Cont := L.Cont - 1;
         end if;
      end loop;
   end eliminar_elemento;

   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------

   procedure insertar_elemento_en_pos
     (num, pos: in Integer;
      L: in out T_Lista_Estatica)
   is
   begin
      if pos in L.Dato'first..L.Dato'first + L.Cont then
         L.Dato(L.Dato'first..L.Dato'first + L.Cont) := L.Dato(L.Dato'first..L.Dato'first + pos - 2) & num & L.Dato(L.Dato'first + pos - 1..L.Dato'first + L.Cont - 1);
         L.Cont := L.Cont + 1;
      end if;
   end insertar_elemento_en_pos;

   ----------------
   -- Pos_Maximo --
   ----------------

   function Pos_Maximo (L: in T_Lista_Estatica) return Integer is
      pos : Integer := 0;
   begin
      if L.Cont > 0 then
         pos := L.Dato'first;
         for i in L.Dato'first + 1..L.Dato'first + L.Cont - 1 loop
            if L.Dato(i) > L.Dato(pos) then
               pos := i;
            end if;
         end loop;
      end if;
      return pos;
   end Pos_Maximo;

   ---------------------
   -- Ordenar_Burbuja --
   ---------------------

   procedure intercambiar (L : in out T_Lista_Estatica; P1, P2 : in Integer) is
      aux : Integer;
   begin
      aux := L.Dato(P1);
      L.Dato(P1) := L.Dato(P2);
      L.Dato(P2) := aux;
   end intercambiar;

   procedure Ordenar_Burbuja (L: in out T_Lista_Estatica) is
      cont2 : Integer := L.Cont - 1;
   begin
      for i in L.Dato'first..L.Dato'first + L.Cont - 1 loop
         for j in L.Dato'first..L.Dato'first + cont2 - 1 loop
            if L.Dato(j) < L.Dato(j + 1) then
               intercambiar(L, j, j + 1);
            end if;
         end loop;
         cont2 := cont2 - 1;
      end loop;

   end Ordenar_Burbuja;

   --------------
   -- Posicion --
   --------------

   procedure Posicion(M: in T_Matriz;Num: in Integer;Fil,Col: out Integer) is
      i, j : Integer;
   begin
      Fil := 0;
      Col := 0;
      i := M'first(1);
      loop
         j := M'first(2);
         loop
            if M(i, j) = Num then
               Fil := i;
               Col := j;
            end if;
            exit when M(i,j) = Num or j = M'last(2);
            j := j + 1;
         end loop;
         exit when M(i,j) = Num or i = M'last(1);
         i := i + 1;
      end loop;

   end Posicion;

   ------------
   -- Maximo --
   ------------

   procedure Maximo (M: in T_Matriz; Maximo,Fila,Columna: out Integer) is
      i, j : Integer;
   begin
      Maximo := M(M'first(1), M'first(2));
      i := M'first(1);
      Fila := i;
      Columna := M'first(2);
      loop
         j := M'first(2);
         loop
            if M(i, j) > Maximo then
               Fila := i;
               Columna := j;
               Maximo := M(i,j);
            end if;
            exit when j = M'last(2);
            j := j + 1;
         end loop;
         exit when i = M'last(1);
         i := i + 1;
      end loop;

   end Maximo;

end Laboratorio08;
