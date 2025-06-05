-----------------------------------------------------------------------------------
-- #                          Copyright CNES 2025                                 #
-- #                                                                              #
-- # This source describes Open Hardware and is licensed under the CERN-OHL-W v2. #
-- #                                                                              #
-- # You may redistribute and modify this documentation and make products         #
-- # using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).     #
-- #                                                                              #
-- # This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED             #
-- # WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY                 #
-- # AND FITNESS FOR A PARTICULAR PURPOSE.                                        #
-- #                                                                              #
-- # Please see the CERN-OHL-W v2 for applicable conditions.                      #
-----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Auteur(s)        :
--
-- Projet           :
--
-- Date de creation :
--
-- Description      : package de fonctions synthetisables utiles
--
----------------------------------------------------------------------------
-- Historique    :
--
-- v1.0 14/01/15 Philippe LESPRIT
-- Creation
--
-- v1.1 10/08/15 Philippe LESPRIT
-- Correction fonction log2
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- DECLARATION DES LIBRAIRIES                                                --
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

-------------------------------------------------------------------------------
-- DECLARATION DU PACKAGE                                                    --
-------------------------------------------------------------------------------
package PKG_TOOLS IS

-----------------------------------------
-- DEFINITION DES FONCTIONS
-----------------------------------------

   ---------------------------------------------------------------------------
   -- Fonction renvoyant l'arrondi superieur de log2(A)
   -- Ex : log2(31)=5
   --      log2(32)=5
   --      log2(33)=6
   -- Pour avoir le nombre de bit pour coder la valeur A => prendre (log2(A)   downto 0)
   -- Pour avoir le nombre de bit pour coder A valeurs   => prendre (log2(A)-1 downto 0)
   ---------------------------------------------------------------------------
   function log2(
      A : integer
   ) return integer;

   ---------------------------------------------------------------------------
   -- Fonction realisant un OU logique entre tous les bits d'un vecteur
   -- Ex : or_all("100010") = '1'
   --      or_all("0000") = '0'
   ---------------------------------------------------------------------------
   function or_all(
      A : std_logic_vector
   ) return std_logic;

   ---------------------------------------------------------------------------
   -- Fonction realisant un ET logique entre tous les bits d'un vecteur
   -- Ex : and_all("100010") = '0'
   --      and_all("1111") = '1'
   ---------------------------------------------------------------------------
   function and_all(
      A : std_logic_vector
   ) return std_logic;

   ---------------------------------------------------------------------------
   -- Fonction realisant un NAND entre tous les bits d'un vecteur
   -- Ex : and_all("100010") = '0'
   --      and_all("1111") = '1'
   ---------------------------------------------------------------------------
   function nand_all(
      A : std_logic_vector
   ) return std_logic;

   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur signe
   -- SatCmd est le nombre de bits à éliminer
   -- Ex : sat("00101",2) = "101"
   --      sat("01001",2) = "011"
   --      sat("10000",2) = "100",
   ---------------------------------------------------------------------------
   function sat(
       DataIn  : signed;
       SatCmd  : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur non signe
   -- SatCmd est le nombre de bits à éliminer
   -- Ex : sat("10101",2) = "111"
   --      sat("00101",2) = "101"
   ---------------------------------------------------------------------------
   function sat(
       DataIn  : unsigned;
       SatCmd  : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur signe avec renvoi du statut de
   -- saturation
   -- SatCmd est le nombre de bits à éliminer
   -- DataSat est le statut de saturation (0=non sature, 1=sature)
   -- Ex : sat("00101",2) = ("101",'0')
   --      sat("01001",2) = ("011",'1')
   --      sat("10000",2) = ("100",'1')
   ---------------------------------------------------------------------------
   procedure sat(    -- Signed Saturator
          DataIn  : in    signed;
          SatCmd  : in    positive;
   signal DataOut : out   std_logic_vector;
   signal DataSat : out   std_logic
   );

   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur non signe avec renvoi du statut de
   -- saturation
   -- SatCmd est le nombre de bits à éliminer
   -- DataSat est le statut de saturation (0=non sature, 1=sature)
   -- Ex : sat("10101",2) = ("111",'1')
   --      sat("00101",2) = ("101",'0')
   ---------------------------------------------------------------------------
   procedure sat(    -- UnSigned Saturator
          DataIn  : in    unsigned;
          SatCmd  : in    positive;
   signal DataOut : out   std_logic_vector;
   signal DataSat : out   std_logic
   );

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi d'1 bit de partie decimale sur un vecteur signe
   -- Ex : sat("10101") =
   --      sat("00101") = "0011"
   ---------------------------------------------------------------------------
   function arrondi(
       A : signed
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi d'1 bit de partie decimale sur un vecteur non signe
   -- Ex : sat("10100") = "1010"
   --      sat("00101") = "0011"
   ---------------------------------------------------------------------------
   function arrondi(
       A : unsigned
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi sur un vecteur signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) =
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi(
      A        : signed;
      Cmd      : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) = "110"
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi(
      A        : unsigned;
      Cmd      : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi inferieur sur un vecteur signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) =
   --      sat("00100",3) = "00"
   ---------------------------------------------------------------------------
   function arrondi_inf(
      A        : signed;
      Cmd      : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi inferieur sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10111",2) = "101"
   --      sat("00100",3) = "00"
   ---------------------------------------------------------------------------
   function arrondi_inf(
      A        : unsigned;
      Cmd      : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction d'arrondi superieur sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10101",2) = "110"
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi_sup(
      A        : unsigned;
      Cmd      : positive
   ) return std_logic_vector;

   ---------------------------------------------------------------------------
   -- Fonction calculant la valeur absolu d'un vecteur signe
   -- Ex : absolu("10101") =
   ---------------------------------------------------------------------------
   function absolu(
       A       : signed
   ) return unsigned;

   ---------------------------------------------------------------------------
   -- Fonction calculant la valeur absolu d'un vecteur signe
   -- Ex : absolu("10101") =
   ---------------------------------------------------------------------------
   function absolu(
       A       : signed
   ) return signed;


end package PKG_TOOLS;


-------------------------------------------------------------------------------
-- DECLARATION DU PACKAGE BODY                                               --
-------------------------------------------------------------------------------
package body PKG_TOOLS is


   ---------------------------------------------------------------------------
   -- Fonction renvoyant l'arrondi superieur de log2(A)
   -- Ex : log2(31)=5
   --      log2(32)=5
   --      log2(33)=6
   -- Pour avoir le nombre de bit pour coder la valeur A => prendre (log2(A)   downto 0)
   -- Pour avoir le nombre de bit pour coder A valeurs   => prendre (log2(A)-1 downto 0)
   ---------------------------------------------------------------------------
   function log2(
      A : integer
   ) return integer is
       variable result : integer;
   begin
       result  := 0;
       while ((2**result)<A) loop
           result := result+1;
       end loop;
       return result;
   end function Log2;


   ---------------------------------------------------------------------------
   -- Fonction realisant un OU logique entre tous les bits d'un vecteur
   -- Ex : or_all("100010") = '1'
   --      or_all("0000") = '0'
   ---------------------------------------------------------------------------
   function or_all(
      A         : std_logic_vector
   ) return std_logic is
   begin
      for i in A'low to A'high loop
         if A(i) = '1' then
            return '1';
         end if;
      end loop;
      return '0';
   end OR_All;


   ---------------------------------------------------------------------------
   -- Fonction realisant un ET logique entre tous les bits d'un vecteur
   -- Ex : and_all("100010") = '0'
   --      and_all("1111") = '1'
   ---------------------------------------------------------------------------
   function and_all(
      A         : std_logic_vector
   ) return std_logic is
   begin
      for i in A'low to A'high loop
         if A(i) = '0' then
            return '0';
         end if;
      end loop;
      return '1';
   end AND_All;


   ---------------------------------------------------------------------------
   -- Fonction realisant un NAND entre tous les bits d'un vecteur
   -- Ex : and_all("100010") = '0'
   --      and_all("1111") = '1'
   ---------------------------------------------------------------------------
   function nand_all(
      A         : std_logic_vector
   ) return std_logic is
   begin
      for i in A'low to A'high loop
         if A(i) = '0' then
            return '1';
         end if;
      end loop;
      return '0';
   end NAND_All;


   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur signe
   -- SatCmd est le nombre de bits à éliminer
   -- Ex : sat("00101",2) = "101"
   --      sat("01001",2) = "011"
   --      sat("10000",2) = "100",
   ---------------------------------------------------------------------------
   function sat(
      DataIn  : signed;
      SatCmd  : positive
   ) return std_logic_vector is
   variable DataInVec : std_logic_vector(DataIn'range);
   variable TestSatur : std_logic;
   variable SatValue  : std_logic_vector(DataIn'high-SatCmd downto DataIn'low);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (SatCmd <= DataIn'high)
      report "Saturation Distance greater than Input Vector Width"
      severity ERROR;
      assert (SatCmd >= 1)
      report "Saturation Distance negative or null"
      severity ERROR;
      assert (DataIn'high > 1)
      report "Input Vector too short"
      severity ERROR;
      assert (DataIn'high > DataIn'low)
      report "Input Vector Range Error"
      severity ERROR;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      DataInVec := std_logic_vector(DataIn);
      ---------------------------------------------------------------------------
      -- Elaborating saturation command : - TestSatur = 0 => No Saturation
      --                                  - TestSatur = 1 => Saturation
      if DataInVec(DataInVec'high) = '0' then
         TestSatur := OR_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd)
                      );
      else
         TestSatur := NAND_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd)
                      );
      end if;
      ---------------------------------------------------------------------------
      -- Elaborating saturation :
      if TestSatur = '0' then
         return DataInVec(DataInVec'high-SatCmd downto DataInVec'low);
      else
         for i in DataInVec'high-SatCmd downto DataInVec'low loop
            if i = DataInVec'high-SatCmd then
               SatValue(i) := DataInVec(DataInVec'high);
            else
               SatValue(i) := not DataInVec(DataInVec'high);
            end if;
         end loop;
         return SatValue;
      end if;
   end Sat;


   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur non signe
   -- SatCmd est le nombre de bits à éliminer
   -- Ex : sat("10101",2) = "111"
   --      sat("00101",2) = "101"
   ---------------------------------------------------------------------------
   function sat(
      DataIn  : unsigned;
      SatCmd  : positive
   ) return std_logic_vector is
   variable DataInVec : std_logic_vector(DataIn'range);
   variable TestSatur : std_logic;
   variable SatValue  : std_logic_vector(DataIn'high-SatCmd downto DataIn'low);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (SatCmd <= DataIn'high)
      report "Saturation Distance greater than Input Vector Width"
      severity ERROR;
      assert (SatCmd >= 1)
      report "Saturation Distance negative or null"
      severity ERROR;
      assert (DataIn'high > 1)
      report "InputVector too short"
      severity ERROR;
      assert (DataIn'high > DataIn'low)
      report "Input Vector Range Error"
      severity ERROR;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      DataInVec := std_logic_vector(DataIn);
      ---------------------------------------------------------------------------
      -- Elaborating saturation command : - TestSatur = 0 => No Saturation
      --                                  - TestSatur = 1 => Saturation
      if SatCmd = 1 then
         TestSatur := DataInVec(DataInVec'high);
      else
         TestSatur := OR_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd+1)
                      );
      end if;
      ---------------------------------------------------------------------------
      -- Elaborating the saturation :
      --
      if TestSatur = '0' then
         return DataInVec(DataInVec'high-SatCmd downto DataInVec'low);
      else
         SatValue := (others => '1');
         return SatValue;
      end if;
   end Sat;


   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur signe avec renvoi du statut de
   -- saturation
   -- SatCmd est le nombre de bits à éliminer
   -- DataSat est le statut de saturation (0=non sature, 1=sature)
   -- Ex : sat("00101",2) = ("101",'0')
   --      sat("01001",2) = ("011",'1')
   --      sat("10000",2) = ("100",'1')
   ---------------------------------------------------------------------------
   procedure sat(
          DataIn  : in    signed;
          SatCmd  : in    positive;
   signal DataOut : out   std_logic_vector;
   signal DataSat : out   std_logic
   ) is
   variable DataInVec : std_logic_vector(DataIn'range);
   variable TestSatur : std_logic;
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (SatCmd <= DataIn'high)
      report "Saturation Distance greater than Input Vector Width"
      severity ERROR;
      assert (SatCmd >= 1)
      report "Saturation Distance negative or null"
      severity ERROR;
      assert (DataIn'high > 1)
      report "Input Vector too short"
      severity ERROR;
      assert (DataIn'high > DataIn'low)
      report "Input Vector Range Error"
      severity ERROR;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      DataInVec := std_logic_vector(DataIn);
      ---------------------------------------------------------------------------
      -- Elaborating saturation command : - TestSatur = 0 => No Saturation
      --                                  - TestSatur = 1 => Saturation
      if DataInVec(DataInVec'high) = '0' then
         TestSatur := OR_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd)
                      );
      else
         TestSatur := NAND_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd)
                      );
      end if;
      ---------------------------------------------------------------------------
      -- Elaborating saturation :
      if TestSatur = '0' then
         DataOut <= DataInVec(DataInVec'high-SatCmd downto DataInVec'low);
         DataSat <= '0';
      else
         for i in DataInVec'high-SatCmd downto DataInVec'low loop
            if i = DataInVec'high-SatCmd then
               DataOut(i) <= DataInVec(DataInVec'high);
            else
               DataOut(i) <= not DataInVec(DataInVec'high);
            end if;
         end loop;
         DataSat <= '1';
      end if;
   end Sat;


   ---------------------------------------------------------------------------
   -- Fonction de saturation sur un vecteur non signe avec renvoi du statut de
   -- saturation
   -- SatCmd est le nombre de bits à éliminer
   -- DataSat est le statut de saturation (0=non sature, 1=sature)
   -- Ex : sat("10101",2) = ("111",'1')
   --      sat("00101",2) = ("101",'0')
   ---------------------------------------------------------------------------
   procedure sat(
          DataIn  : in    Unsigned;
          SatCmd  : in    positive;
   signal DataOut : out   std_logic_vector;
   signal DataSat : out   std_logic
   ) is
   variable DataInVec : std_logic_vector(DataIn'range);
   variable TestSatur : std_logic;
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (SatCmd <= DataIn'high)
      report "Saturation Distance greater than Input Vector Width"
      severity ERROR;
      assert (SatCmd >= 1)
      report "Saturation Distance negative or null"
      severity ERROR;
      assert (DataIn'high > 1)
      report "InputVector too short"
      severity ERROR;
      assert (DataIn'high > DataIn'low)
      report "Input Vector Range Error"
      severity ERROR;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      DataInVec := std_logic_vector(DataIn);
      ---------------------------------------------------------------------------
      -- Elaborating saturation command : - TestSatur = 0 => No Saturation
      --                                  - TestSatur = 1 => Saturation
      if SatCmd = 1 then
         TestSatur := DataInVec(DataInVec'high);
      else
         TestSatur := OR_All(
                         DataInVec(DataInVec'high downto DataInVec'high-SatCmd+1)
                      );
      end if;
      ---------------------------------------------------------------------------
      -- Elaborating the saturation :
      --
      if TestSatur = '0' then
         DataOut <= DataInVec(DataInVec'high-SatCmd downto DataInVec'low);
         DataSat <= '0';
      else
         for i in DataInVec'high-SatCmd downto DataInVec'low loop
            DataOut(i) <= '1';
         end loop;
         DataSat <= '1';
      end if;
   end Sat;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi d'1 bit de partie decimale sur un vecteur signe
   -- Ex : sat("10101") =
   --      sat("00101") = "0011"
   ---------------------------------------------------------------------------
   function arrondi(
       A      : signed
   ) return std_logic_vector is
   variable B         : signed(1 downto 0);
   variable Operation : signed(A'length downto 0);
   begin
      if A(A'high) = '1' then
         B := "00";
      else
         B := "01";
      end if;
      Operation := resize(A, Operation'length) + resize(B, Operation'length);
      return Sat(Operation(Operation'high downto Operation'low+1), 1);
   end Arrondi;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi d'1 bit de partie decimale sur un vecteur non signe
   -- Ex : sat("10100") = "1010"
   --      sat("00101") = "0011"
   ---------------------------------------------------------------------------
   function arrondi(
       A      : unsigned
   ) return std_logic_vector is
   variable B         : unsigned(1 downto 0);
   variable Operation : unsigned(A'length downto 0);
   begin
      B := "01";
      Operation := resize(A, Operation'length) + resize(B, Operation'length);
      return Sat(Operation(Operation'high downto Operation'low+1), 1);
   end Arrondi;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi sur un vecteur signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) =
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi(
      A       : signed;
      Cmd     : positive
   ) return std_logic_vector is
   variable B         : signed(Cmd downto 0);
   variable Operation : signed(A'length downto 0);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (Cmd < A'length)
      report "Le nombre de bits d'arrondi est supérieur à celui du vecteur d'entre"
      severity ERROR;
      assert (Cmd > 1)
      report "Le nombre de bits d'arrondi doit être supérieur à 1"
      severity ERROR;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      for i in B'range loop
         if i = B'high then
            B(i) := '0';
         elsif i = B'high-1 then
            B(i) := not A(A'high);
         else
            B(i) := A(A'high);
         end if;
      end loop;
      Operation := resize(A, Operation'length) + resize(B, Operation'length);
      return Sat(Operation(Operation'high downto Cmd), 1);
   end Arrondi;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) = "110"
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi(
      A       : unsigned;
      Cmd     : positive
   ) return std_logic_vector is
   variable A_Vec : unsigned(A'high downto Cmd-1);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (Cmd < A'length)
      report "Le nombre de bits d'arrondi est supérieur à celui du vecteur d'entrée"
      severity FAILURE;
      assert (Cmd > 1)
      report "Le nombre de bits d'arrondi doit être supérieur à 1"
      severity FAILURE;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      A_Vec := A(A_Vec'range);
      return Arrondi(A_Vec);
   end Arrondi;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi inferieur sur un vecteur signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10100",2) =
   --      sat("00100",3) = "00"
   ---------------------------------------------------------------------------
   function arrondi_inf(
      A        : unsigned;
      Cmd      : positive
   ) return std_logic_vector is
   variable A_Vec : std_logic_vector(A'length-1 downto 0);
   variable B_Vec : std_logic_vector(A'length-(1+Cmd) downto 0);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (Cmd < A'length)
      report "Le nombre de bits de la partie décimale est supérieur à celui du vecteur d'entré"
      severity FAILURE;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      A_Vec := std_logic_vector(A);
      B_Vec := A_Vec(A_vec'high downto Cmd);
      return B_Vec;
   end Arrondi_Inf;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi inferieur sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10111",2) = "101"
   --      sat("00100",3) = "00"
   ---------------------------------------------------------------------------
   function arrondi_inf(
      A        : signed;
      Cmd      : positive
   ) return std_logic_vector is
   variable A_Vec : std_logic_vector(A'length-1 downto 0);
   variable B_Vec : std_logic_vector(A'length-(1+Cmd) downto 0);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (Cmd < A'length)
      report "Le nombre de bits de la partie décimale est supérieur à celui du vecteur d'entre"
      severity FAILURE;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      A_Vec := std_logic_vector(A);
      B_Vec := A_Vec(A_vec'high downto Cmd);
      return B_Vec;
   end Arrondi_Inf;


   ---------------------------------------------------------------------------
   -- Fonction d'arrondi superieur sur un vecteur non signe
   -- Cmd est le nombre de bits à éliminer
   -- Ex : sat("10101",2) = "110"
   --      sat("00100",3) = "01"
   ---------------------------------------------------------------------------
   function arrondi_sup(
      A        : unsigned;
      Cmd      : positive
   ) return std_logic_vector is
   variable A_Vec     : unsigned(A'length-1 downto 0);
   variable B_Vec     : unsigned(A'length-Cmd downto 0);
   variable C_Vec     : std_logic_vector(Cmd-1 downto 0);
   variable OR_C      : std_logic;
   variable Zero_OR_C : std_logic_vector(1 downto 0);
   variable Add       : unsigned(B_Vec'range);
   variable Operation : unsigned(B_Vec'range);
   begin
      ---------------------------------------------------------------------------
      -- pragma translate_off
      ---------------------------------------------------------------------------
      assert (Cmd < A'length)
      report "Le nombre de bits de la partie décimale est supérieur à celui du vecteur d'entré"
      severity FAILURE;
      ---------------------------------------------------------------------------
      -- pragma translate_on
      ---------------------------------------------------------------------------
      A_Vec     := A;
      B_Vec     := '0' & A_Vec(A_Vec'high downto Cmd);
      C_Vec     := std_logic_vector(A_Vec(Cmd-1 downto 0));
      OR_C      := OR_All(C_Vec);
      Zero_OR_C := '0' & OR_C;
      Add       := resize(unsigned(Zero_OR_C), Add'length);
      Operation := B_Vec + Add;
      return sat(Operation, 1);
   end Arrondi_Sup;


   ---------------------------------------------------------------------------
   -- Fonction calculant la valeur absolu d'un vecteur signe
   -- Ex : absolu("10101") =
   ---------------------------------------------------------------------------
   function absolu(
      A       : signed
   ) return unsigned is
   variable A_sxt : signed(A'length downto 0);
   variable tmp   : signed(A'length downto 0);
   begin
      A_sxt := '1' & A;

      if A(A'high) = '0' then
         return unsigned(A);
      else
          tmp := 0 - A_sxt;
          return unsigned(tmp(tmp'high-1 downto 0));
      end if;
   end Absolu;


   ---------------------------------------------------------------------------
   -- Fonction calculant la valeur absolu d'un vecteur signe
   -- Ex : absolu("10101") =
   ---------------------------------------------------------------------------
   function absolu(
      A       : signed
   ) return signed is
   variable A_ext : signed(A'length downto 0);
   variable A_sxt : signed(A'length downto 0);
   variable tmp   : signed(A'length downto 0);
   begin
      A_ext := '0' & A;
      A_sxt := '1' & A;

      if A(A'high) = '0' then
         return A_ext;
      else
          tmp := 0 - A_sxt;
          return tmp;
      end if;
   end Absolu;


end package body PKG_TOOLS;

-------------------------------------------------------------------------------
-- Fin de Code
-------------------------------------------------------------------------------
