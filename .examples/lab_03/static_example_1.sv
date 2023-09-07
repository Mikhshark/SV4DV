module static_example_1;

    class base1;

        static int b;
        static int a = get_a();

        static function int get_a();
            return 5;
        endfunction

        static function void set_b(int _b);
            b = _b;
        endfunction

        static function void print();
            $display("a = %0d b = %0d", a, b);
        endfunction

        // In this function variable 'c' is automatic
        // Because this is class 'static function', not
        // default 'function static'
        static function void static_class_func(bit incr);
            int c;
            if(incr) c = c + 1;
            $display("class_func: c = %0d", c);
        endfunction

    endclass

    // In this function variable 'c' is static
    // Because this is default 'function static'
    // class 'static function'
    function static static_base_func(bit incr);
        int c;
        if(incr) c = c + 1;
        $display("base_func: c = %0d", c);
    endfunction


    initial begin
        base1::set_b(10);
        base1::print();
        base1::static_class_func(1);
        base1::static_class_func(1);
        static_base_func(1);
        static_base_func(1);
    end

endmodule
