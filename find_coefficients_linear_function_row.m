function [coefficients_linear_function_row,coefficients_costs]=find_coefficients_linear_function_row(linear_function,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B)

temp= coeffs(linear_function,s_A_L);
if size(temp,2)>1
    coefficients_linear_function_row(1,1)=temp(1,2);
else
    coefficients_linear_function_row(1,1)=0*s_A_L;
end

temp= coeffs(linear_function,p_A_L);
if size(temp,2)>1
    coefficients_linear_function_row(1,2)=temp(1,2);
else
    coefficients_linear_function_row(1,2)=0*p_A_L;
end

temp= coeffs(linear_function,s_A_H);
if size(temp,2)>1
    coefficients_linear_function_row(1,3)=temp(1,2);
else
    coefficients_linear_function_row(1,3)=0*s_A_H;
end

temp= coeffs(linear_function,p_A_H);
if size(temp,2)>1
    coefficients_linear_function_row(1,4)=temp(1,2);
else
    coefficients_linear_function_row(1,4)=0*p_A_H;
end

temp= coeffs(linear_function,p_B_LLL);
if size(temp,2)>1
    coefficients_linear_function_row(1,5)=temp(1,2);
else
    coefficients_linear_function_row(1,5)=0*p_B_LLL;
end

temp= coeffs(linear_function,p_B_LHL);
if size(temp,2)>1
    coefficients_linear_function_row(1,6)=temp(1,2);
else
    coefficients_linear_function_row(1,6)=0*p_B_LHL;
end

temp= coeffs(linear_function,p_B_HLL);
if size(temp,2)>1
    coefficients_linear_function_row(1,7)=temp(1,2);
else
    coefficients_linear_function_row(1,7)=0*p_B_HLL;
end

temp= coeffs(linear_function,p_B_HHL);
if size(temp,2)>1
    coefficients_linear_function_row(1,8)=temp(1,2);
else
    coefficients_linear_function_row(1,8)=0*p_B_HHL;
end

temp= coeffs(linear_function,c_A);
if size(temp,2)>1
    coefficients_costs(1,1)=temp(1,2);
else
    coefficients_costs(1,1)=0*c_A;
end

temp= coeffs(linear_function,c_B);
if size(temp,2)>1
    coefficients_costs(1,2)=temp(1,2);
else
    coefficients_costs(1,2)=0*c_B;
 
end