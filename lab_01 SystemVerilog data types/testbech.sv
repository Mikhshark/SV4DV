module testbench();

  /*
    =====================
          Задание 1
    =====================
  */


  /*
    Описанный ниже объект должен быть типа logic
  */
  // logic_obj;

  /*
    Описанный ниже объект должны быть 8-разрядным вектором типа bit
  */
  // eight_bit_vec_obj;

  /*
    Описанный ниже объект должен быть дважды упакованным массивом, состоящим
    из четырех двухразрядных векторов типа wire
    (помните про правило доступа к элементам "слева-направо")
  */
  // double_packed_wire_array;

  /*
    Описанный ниже объект должен быть массивом, состоящим из двух элементов
    типа int
  */
   // two_ints_array;

  /*
    Описанный ниже объект должен распакованным массивом, состоящим из двух
    элементов, являющихся пакованными массивами двух трёхразрядных элементов
    типа reg
  */
   // unpacked_arr_of_double_packed_reg_obj;

  /*
    Объект ниже уже имеет тип enum_typename. Вам необходимо создать этот тип
    с помощью ключевого слова typedef. Данный тип должен иметь название
    enum_typename и являться перечислением значений
    {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN} в трехбитном векторе типа
    logic
  */
  //
  //enum_typename enum_obj;

  /*
    Описанный ниже объект должен быть типа event
  */
  // event_obj;

  /*
    Описанный ниже объект должен быть динамическим массивом восьмибитных
    векторов типа reg
  */
  // eight_regs_vec_dyn_arr_obj;

  /*
    Описанный ниже объект должен быть очередью восьмибитных векторов типа bit
  */
  // eight_bits_vec_queue_obj;

  /*
    Описанный ниже объект должен быть ассоциативным массивом, содержащим
    восьмибитные вектора типа logic, доступные по ключу типа string
  */
  // eight_logic_vec_map_str_obj;

  /*
    TODO добавить структуру
  */






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
    automatic string test_type;
    automatic string ref_type;
    automatic byte ref_type_char_arr[];

    test_type         = $typename(logic_obj);
    ref_type_char_arr = new[5]('{108, 111, 103, 105, 99});
    check_type(test_type, "logic_obj", ref_type_char_arr);

    test_type         = $typename(eight_bit_vec_obj);
    ref_type_char_arr = new[8]('{98, 105, 116, 91, 55, 58, 48, 93});
    check_type(test_type, "eight_bit_vec_obj", ref_type_char_arr);

    test_type         = $typename(double_packed_wire_array);
    ref_type_char_arr = new[14]('{119, 105, 114, 101, 91, 51, 58, 48, 93, 91, 50, 58, 48, 93});
    check_type(test_type, "double_packed_wire_array", ref_type_char_arr);

    test_type         = $typename(two_ints_array);
    ref_type_char_arr = new[9]('{105, 110, 116, 36, 91, 48, 58, 49, 93});
    check_type(test_type, "two_ints_array", ref_type_char_arr);

    test_type         = $typename(unpacked_arr_of_double_packed_reg_obj);
    ref_type_char_arr = new[19]('{114, 101, 103, 91, 49, 58, 48, 93, 91, 50, 58, 48, 93, 36, 91, 48, 58, 49, 93});
    check_type(test_type, "unpacked_arr_of_double_packed_reg_obj", ref_type_char_arr);

    test_type         = $typename(enum_obj);
    ref_type_char_arr = new[26]('{101, 110, 117, 109, 32, 116, 101, 115, 116, 95, 115, 118, 46, 101, 110, 117, 109, 95, 116, 121, 112, 101, 110, 97, 109, 101});
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
      $display("TEST FAILED");
      $finish();
  end

  function void check_type(string test_type, string test_obj, byte ref_arr[]);
    automatic string ref_type = string'(ref_arr);
    if(test_type != ref_type) begin
      $display("Object \"%s\" is of the incorrect type \"%s\"", test_obj, test_type);
      err_count++;
    end
  endfunction

endmodule
