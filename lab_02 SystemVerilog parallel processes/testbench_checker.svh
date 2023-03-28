    /*
      Task 1.
      Задайте единицы измерения и округления времени через
      'timeunit' и 'timeprecision' 1ns и 1ps соответственно.
    */

    initial begin
        #1.0005;
        if($realtime()*1.0ns != 1.001ns)
            $error("Task 1: timeunit or timeprecision is invalid!");
    end


    /*
      Task 2.
      Создайте переменную 'strobe' типа 'bit'.
      Используя '#', задайте 'strobe = 1' через 2ns.
    */

    initial begin
        fork
            #3;
            wait(strobe);
        join_any
        if($time() != 2)
            $error("Task 2: 'strobe' = 1 time is invalid!");
    end


    /*
      Task 3.
      Используя 'wait', ожидайте 'strobe_tb == 1'.
    */

    initial begin
        #2 strobe_tb = 1;
        fork
            #3;
            wait(task_3_done);
        join_any
        if($time() != 2)
            $error("Task 3: 'wait' was not executed properly");
    end


    /*
      Task 4.
      Определите и создайте 'mailbox', параметрищуемый типом 'int'.
      Имя 'mailbox' дайте 'mbx'.
      Далее используйте put() и положите туда число 32.
    */

    initial begin
        int a;
        fork
            #1;
            mbx.get(a);
        join_any
        if(a != 32)
            $error("Task 4: Number 32 was not in mailbox");
    end


    /*
      Task 5.
      Создайте переменную 'mbx_data' типа 'int'.
      Заберите через get() в 'mbx_data' число из mailbox
      c именем 'mbx_tb'
    */

    initial begin
        #2; mbx_tb.put(1);
        fork
            #1;
            wait(task_5_done);
        join_any
        if(mbx_data != 1)
            $error("Task 5: 'get' was not executed properly");
    end


    /*
      Task 6.
      Создайте 'event' с именем 'ev'.
      Запустите 'ev'.
    */

    initial begin
        fork
            #1;
            wait(ev.triggered());
        join_any
        if($time() != 0)
            $error("Task 6: 'ev' was not triggered at time 0");
    end


    /*
      Task 7.
      Ждите event с именем 'ev_tb' через wait().
    */

    initial begin
        fork
            begin
                #2 -> ev_tb;
                #1;
            end
            wait(task_7_done);
        join_any
        if($time() != 2)
            $error("Task 7: 'wait' for event was not executed properly");
    end


    /*
      Task 8.
      Определите 2 переменных: 'a', 'b' типа 'bit'
      При помощи 'fork-join_none' выставите их в 1 с задержками
      50 10.
    */

    initial begin
        fork
            #1;
            wait(task_8_done);
        join_any
        if($time() != 0)
            $error("Task 8: 'fork-join_none' was not executed properly");
    end

    initial begin
        fork
            #51;
            wait(a);
        join_any
        if($time() != 50)
            $error("Task 8: 'a' was not set properly");
    end

    initial begin
        fork
            #11;
            wait(b);
        join_any
        if($time() != 10)
            $error("Task 8: 'b' was not set properly");
    end


    /*
      Task 9.
      Отключите fork ниже, когда 'c' будет равно 1
    */

    initial begin
        fork
            #21;
            wait(d);
        join_any
        if($time() != 21)
            $error("Task 9: 'fork' was not disabled");
    end


    /*
      Task 10.
      Напишите функцию 'sum', вычисляющую сумму 2ух чисел типа 'int'
      и возвращающую сумму тоже типом 'int'
    */

    initial begin
        int a;
        if($typename(sum(5, 10)) != $typename(a))
            $error("Task 10: function return type is invalid");
        a = sum(5, 10);
        if(a != 15)
            $error("Task 10: function return value is invalid");
    end


    /*
      Task 11.
      Напишите задачу 'sum_task', которая вызывает функцию sum
      для 2ух чисел. Задержка перед вызовом должна равняться 10ns.
      Задача должна возвращать сумму через 3 аргумент.
    */

    initial begin
        int c;
        fork
            #11;
            sum_task(5, 10, c);
        join_any
        if($time() != 10)
            $error("Task 11: delay in 'sum_task' is invalid");
        else if(c != 15)
            $error("Task 11: task return value is invalid");
    end


    /*
      Task 12.
      Напишите автоматическую функцию 'fib', рекурсивно
      вычисляющее сумму последовательности Фибоначчи.
      Размер последовательности задайте аргументом типа 'int'.
      Возвращаемое значение тоже типа 'int'
    */

    initial begin
        int a;
        a = fib(10);
        if(a != 55)
            $error("Task 12: function return value is invalid");
    end






    initial begin
        $display("All finished! If no errors - good job, all tests was passed!");
        #100; $finish();
    end
