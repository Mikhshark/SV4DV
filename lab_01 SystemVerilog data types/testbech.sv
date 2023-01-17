module testbench();
  timeunit 1ns;
  timeprecision 1ps;
  /*
    =====================
          Задание 1
    =====================
  */


  /*
    Описанный ниже объект должен быть типа logic
  */
  logic_obj;

  /*
    Описанный ниже объект должны быть 12-разрядным вектором типа bit
  */
  twelve_bit_vec_obj;
  
  /*
    Описанный ниже объект должны быть 12-разрядным вектором типа logic
  */
  twelve_log_vec_obj;

  /*
    Описанный ниже объект должен быть дважды упакованным массивом, состоящим
    из четырех трехразрядных векторов типа reg
    (помните про правило доступа к элементам "слева-направо")
  */
  double_packed_reg_array;

  /*
    Описанный ниже объект должен быть массивом, состоящим из двух элементов
    типа int
  */
  two_ints_array;

  /*
    Описанный ниже объект должен распакованным массивом, состоящим из двух
    элементов, являющихся пакованными массивами двух трёхразрядных элементов
    типа reg
  */
  unpacked_arr_of_double_packed_reg_obj;

  /*
    Объект ниже уже имеет тип enum_typename. Вам необходимо создать этот тип
    с помощью ключевого слова typedef. Данный тип должен иметь название
    enum_typename и являться перечислением значений
    {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN} в трехбитном векторе типа
    logic
  */

  enum_typename enum_obj;

  /*
    Описанный ниже объект должен быть типа event
  */
  event_obj;

  /*
    Описанный ниже объект должен быть динамическим массивом восьмибитных
    векторов типа reg
  */
  eight_regs_vec_dyn_arr_obj;

  /*
    Описанный ниже объект должен быть очередью восьмибитных векторов типа bit
  */
  eight_bits_vec_queue_obj;

  /*
    Описанный ниже объект должен быть ассоциативным массивом, содержащим
    восьмибитные вектора типа logic, доступные по ключу типа string
  */
  eight_logic_vec_map_str_obj;


  

  /*
    TODO добавить структуру
  */

  /*
    Описанный ниже объект должны быть 128-разрядным вектором типа bit
  */
  qword_b;

  /*
    Описанный ниже объект должны быть 64-разрядным вектором типа bit
  */
  dword_b;

  /*
    Описанный ниже объект должны быть 64-разрядным вектором типа logic
  */
  dword_l;



  /*
    =====================
          Задание 2
    =====================
  */

  initial begin: scnd_problem

    #2;




  end





  /*
    ========================
    НЕИЗМЕНЯЕМАЯ ЧАСТЬ ФАЙЛА
    ========================
  */

  int err_count = 0;

  initial begin: test_block
    string test_type;
    string ref_type;
    byte ref_type_char_arr[];

    test_type         = $typename(logic_obj);
    ref_type_char_arr = new[5]('{108, 111, 103, 105, 99});
    check_type(test_type, "logic_obj", ref_type_char_arr);

    test_type         = $typename(twelve_bit_vec_obj);
    ref_type_char_arr = new[9]('{98, 105, 116, 91, 49, 49, 58, 48, 93});
    check_type(test_type, "twelve_bit_vec_obj", ref_type_char_arr);

    test_type         = $typename(twelve_log_vec_obj);
    ref_type_char_arr = new[11]('{108, 111, 103, 105, 99, 91, 49, 49, 58, 48, 93});
    check_type(test_type, "twelve_log_vec_obj", ref_type_char_arr);

    test_type         = $typename(double_packed_reg_array);
    ref_type_char_arr = new[14]('{114, 101, 103, 91, 51, 58, 48, 93, 91, 50, 58, 48, 93});
    check_type(test_type, "double_packed_reg_array", ref_type_char_arr);

    test_type         = $typename(two_ints_array);
    ref_type_char_arr = new[9]('{105, 110, 116, 36, 91, 48, 58, 49, 93});
    check_type(test_type, "two_ints_array", ref_type_char_arr);

    test_type         = $typename(unpacked_arr_of_double_packed_reg_obj);
    ref_type_char_arr = new[19]('{114, 101, 103, 91, 49, 58, 48, 93, 91, 50, 58, 48, 93, 36, 91, 48, 58, 49, 93});
    check_type(test_type, "unpacked_arr_of_double_packed_reg_obj", ref_type_char_arr);

    test_type         = $typename(enum_obj);
    ref_type_char_arr = new[28]('{101, 110, 117, 109, 32, 116, 101, 115, 116, 98, 101, 110, 99, 104, 46, 101, 110, 117, 109, 95, 116, 121, 112, 101, 110, 97, 109, 101
});
    check_type(test_type, "enum_obj", ref_type_char_arr);

    test_type         = $typename(event_obj);
    ref_type_char_arr = new[5]('{101, 118, 101, 110, 116});
    check_type(test_type, "event_obj", ref_type_char_arr);

    test_type         = $typename(eight_regs_vec_dyn_arr_obj);
    ref_type_char_arr = new[11]('{114, 101, 103, 91, 55, 58, 48, 93, 36, 91, 93});
    check_type(test_type, "eight_regs_vec_dyn_arr_obj", ref_type_char_arr);

    test_type         = $typename(eight_bits_vec_queue_obj);
    ref_type_char_arr = new[12]('{98, 105, 116, 91, 55, 58, 48, 93, 36, 91, 36, 93});
    check_type(test_type, "eight_bits_vec_queue_obj", ref_type_char_arr);

    test_type         = $typename(eight_logic_vec_map_str_obj);
    ref_type_char_arr = new[19]('{108, 111, 103, 105, 99, 91, 55, 58, 48, 93, 36, 91, 115, 116, 114, 105, 110, 103, 93});
    check_type(test_type, "eight_logic_vec_map_str_obj", ref_type_char_arr);
    if(err_count) begin
      $display("TEST 1 FAILED. Stopping...");
      $finish();
    end
  end

  function automatic void check_type(input string test_type, test_obj, input byte ref_arr[]);
    string ref_type = string'(ref_arr);
    if(test_type != ref_type) begin
      $display("Object \"%s\" is of the incorrect type \"%s\"", test_obj, test_type);
      err_count++;
    end
  endfunction

  initial begin: thrd_problem

    #3;

    dword_b = 64'hdead_beaf_fe11_c01d;
    dword_l = 64'h01xz_10zx_zx01_98zx; // has ones in [12] and [11] bits. Can be used in truncate assignment check
    qword_b = {dword_b, dword_l};
    $display("logic to bit implicit convertion");
    $display("dword_b: 0h%x, dword_l: 0h%x", dword_b, dword_l);
    if(dword_b != 64'hdead_beaf_fe11_c01d) begin
      $display("dword_b value is incorrect\n");
      err_count++;
    end
    if(dword_l !== 64'h01xz_10zx_zx01_98zx) begin
      $display("dword_l value is incorrect\n");
      err_count++;
    end
    $display("qword_b = {dword_b, dword_l}: 0h%x", qword_b);
    if(qword_b != 128'hdeadbeaffe11c01d0100100000019800)begin
      $display("concatenated value (qword_b) is incorrect\n");
      err_count++;
    end
    $display("");

    double_packed_reg_array[0] = 'x;
    double_packed_reg_array[1] = 'z;
    double_packed_reg_array[2] = '0;
    double_packed_reg_array[3] = '1;
    $display("double packed array as one vector:");
    $display("0b%b", double_packed_reg_array);
    twelve_log_vec_obj = double_packed_reg_array;
    $display("twelve bits vector after assigning double packed array value:");
    $display("0b%b", twelve_log_vec_obj);
    if(twelve_log_vec_obj !== 12'b111000zzzxxx) begin
        $display("Incorrect value of twelve bits vector\n");
        err_count++;
    end
    $display("");

    $display("Truncate assignment: double_packed_reg_array = dword_l");
    double_packed_reg_array = dword_l;
    $display("0b%b", double_packed_reg_array);
    if(double_packed_reg_array !== 12'b1000zzzzxxxx) begin
        $display("Incorrect value of double_packed_reg_array\n");
        err_count++;
    end
    $display("");

    dword_l = double_packed_reg_array;

    $display("Assignment extension (double_packed_reg array to dword_l)");
    $display("0h%x", dword_l);
    if(dword_l !== 64'h00000000000008zx) begin
        $display("Incorrect value of dword_l\n");
        err_count++;
    end


    if(err_count) begin
      $display("TEST 3 FAILED.");
    end
    $display("All test runs has been finished.");
  end


endmodule
