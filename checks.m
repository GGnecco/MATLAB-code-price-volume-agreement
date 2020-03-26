%checks

%simulation 1;

%optimal_solution 
%0.1000    1.5000    0.5000    1.5000    0.1000-    0.1000    0.1000
%0.1000-
%s_L  p_L       s_H       p_H       p_B_LL    p_B_LH    p_B_HL    p_B_HH
0.5*optimal_solution(2)*2+0.5*(optimal_solution(4)*3.5+optimal_solution(3)*1.5)

0.5*1*2+0.5*(1*3.5+1*1.5)+1

0.8*(0.5*0.7*optimal_solution(5)*2+0.5*0.3*optimal_solution(6)*5+0.5*0.3*optimal_solution(7)*2+0.5*0.7*optimal_solution(8)*5)

0.8*(0.5*0.7*0.1*2+0.5*0.3*0.1*5+0.5*0.3*0.1*2+0.5*0.7*0.1*5)

%%%%%%%%%%%%%%%%%%%

%simulation 2;

%optimal_solution 
%0    1.6800    1.0000    1.2857    1.0000-    1.0000-    1.0000-
%1.0000-
%s_L  p_L       s_H       p_H       p_B_LL    p_B_LH    p_B_HL    p_B_HH
0.5*optimal_solution(2)*2+0.5*(optimal_solution(4)*3.5+optimal_solution(3)*1.5)

0.5*1*2+0.5*(1*3.5+1*1.5)+0.8*(0.5*0.3*1*1.5)+1

0.8*(0.5*0.7*optimal_solution(5)*2+0.5*0.3*optimal_solution(6)*3.5+0.5*0.3*optimal_solution(7)*2+0.5*0.7*optimal_solution(8)*5)

0.8*(0.5*0.7*1*2+0.5*0.3*1*3.5+0.5*0.3*1*2+0.5*0.7*1*5)

%%%%%%%%%%%%%%%%%%%

%simulation 3;

%optimal_solution 
%0    1.3434    1.1208    1.1208    1.3434    1.1208    1.3434    1.1208
%s_L  p_L       s_H       p_H       p_B_LL    p_B_LH    p_B_HL    p_B_HH
0.5*optimal_solution(2)*2+0.5*(optimal_solution(4)*3.5+optimal_solution(3)*1.5)+...
0.8*(0.5*0.7*optimal_solution(2)*2+0.5*0.3*optimal_solution(2)*3.5+0.5*0.3*optimal_solution(4)*2+...
0.5*0.7*optimal_solution(4)*3.5+0.5*0.7*optimal_solution(3)*1.5)

0.5*1*2+0.5*(1*3.5+1*1.5)+...
0.8*(0.5*0.7*1*2+0.5*0.3*1*3.5+0.5*0.3*1*1.5+0.5*0.3*1*2+...
0.5*0.7*1*3.5+0.5*0.7*1*1.5)+1