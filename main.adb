with Ada.Text_IO;

procedure Main is

   can_stop : boolean := false;
   pragma Atomic(can_stop);

   task type break_thread;
   task type main_thread(ID:Integer);


   task body break_thread is
   begin
      delay 1.0;
      can_stop := true;
   end break_thread;

   task body main_thread is
      sum : Long_Long_Integer := 0;
      b1 : break_thread;
      count_of_operations: Long_Long_Integer := 0;
   begin
      loop
         sum := sum + 1;
         count_of_operations:=count_of_operations+1;
         exit when can_stop;
      end loop;
      Ada.Text_IO.Put_Line("Thread " & ID'Img & " - Sum: " & Sum'Img & " - Operations: " & count_of_operations'Img);
   end main_thread;
   t1 : main_thread(1);
   t2 : main_thread(2);
   t3 : main_thread(3);
   t4 : main_thread(4);

begin

   null;
end Main;
