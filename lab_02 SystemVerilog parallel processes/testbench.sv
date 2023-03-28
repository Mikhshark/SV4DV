module testbench();

    /*
      Task 1.
      Задайте единицы измерения и округления времени через
      'timeunit' и 'timeprecision' 1ns и 1ps соответственно.
    */


    `include "testbench_declarations.svh"


    /*
      Task 2.
      Создайте переменную 'strobe' типа 'bit'.
      Используя '#', задайте 'strobe = 1' через 2ns.
    */


    /*
      Task 3.
      Используя 'wait', ожидайте 'strobe_tb == 1'.
    */

    bit task_3_done;

    initial begin
        // Task3: 'wait' использовать здесь
        task_3_done = 1;
    end


    /*
      Task 4.
      Определите и создайте 'mailbox', параметрищуемый типом 'int'.
      Имя 'mailbox' дайте 'mbx'.
      Далее используйте put() и положите туда число 32.
    */


    /*
      Task 5.
      Создайте переменную 'mbx_data' типа 'int'.
      Заберите через get() в 'mbx_data' число из mailbox
      c именем 'mbx_tb'
    */

    bit task_5_done;

    initial begin
        // Task 5: Заберите здесь
        task_5_done = 1;
    end


    /*
      Task 6.
      Создайте 'event' с именем 'ev'.
      Запустите 'ev'.
    */


    /*
      Task 7.
      Ждите event с именем 'ev_tb' через wait().
    */
    
    bit task_7_done;

    initial begin
        // Task 7: Используйте wait() здесь
        task_7_done = 1;
    end


    /*
      Task 8.
      Определите 2 переменных: 'a', 'b' типа 'bit'
      При помощи 'fork-join_none' выставите их в 1 с задержками
      50 10.
    */

    bit task_8_done;

    initial begin
        // Task 8: 'fork-join_none' используйте здесь
        task_8_done = 1;
    end


    /*
      Task 9.
      Отключите fork ниже, когда 'c' будет равно 1
    */

    bit c, d;

    initial begin
        // NOTE: Здесь используется "безопасный" wrapper
        fork begin
            fork
                #10 c = 1;
                #20 d = 1;
            join_none
            // Task 9: Отключать здесь
        end join
    end


    /*
      Task 10.
      Напишите функцию 'sum', вычисляющую сумму 2ух чисел типа 'int'
      и возвращающую сумму тоже типом 'int'
    */


    /*
      Task 11.
      Напишите задачу 'sum_task', которая вызывает функцию sum
      для 2ух чисел. Задержка перед вызовом должна равняться 10ns.
      Задача должна возвращать сумму через 3 аргумент.
    */


    /*
      Task 12.
      Напишите автоматическую функцию 'fib', рекурсивно
      вычисляющее сумму последовательности Фибоначчи.
      Размер последовательности задайте аргументом типа 'int'.
      Возвращаемое значение тоже типа 'int'
    */


    `include "testbench_checker.svh"


endmodule
