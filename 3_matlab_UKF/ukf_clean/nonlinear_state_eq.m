function f=nonlinear_state_eq(x)
f= [x(2);x(3);0.5*x(1);
    x(5);x(6);(x(1)+x(6));%6
    
    x(8);x(9);0.5*x(7);
    x(11);x(12);(x(10)+x(12));%12
    
    x(14);x(15);0.5*x(13);
    x(17);x(18);(x(16)+x(18));%18
    
    x(20);x(21);0.5*x(19);
    x(23);x(24);(x(22)+x(24));%24
    
    x(26);x(27);0.5*x(25);
    x(29);x(30);(x(28)+x(30));%30
    
    x(31);x(32);%32
    
    ];

