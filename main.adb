with Ada.Text_IO;

procedure Main is

   can_stop : boolean := false;
   pragma Atomic(can_stop);

   task type break_thread;
   task type main_thread(ID:Integer);


   task body break_thread is
   begin
      delay 3.0;
      can_stop := true;
   end break_thread;

   task body main_thread is
      sum : Long_Long_Integer := 0;
      step: Long_Long_Integer := 2;
      count_of_operations: Long_Long_Integer := 0;
   begin
      loop
         sum := sum + step;
         count_of_operations:=count_of_operations+1;
         exit when can_stop;
      end loop;
      Ada.Text_IO.Put_Line("Thread " & ID'Img & " - Sum: " & Sum'Img & " - Operations: " & count_of_operations'Img);
    end main_thread;
    B1 : break_thread;
    count_of_threads: Integer := 10;
    Threads : array(1..count_of_threads) of access main_thread; 
    begin 
      for I in 1..count_of_threads loop
        Threads(I) := new main_thread(I);
     end loop;
end Main;
