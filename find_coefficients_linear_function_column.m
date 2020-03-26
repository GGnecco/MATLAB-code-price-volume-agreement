function [coefficients_linear_function_column,coefficients_costs]=find_coefficients_linear_function_column(linear_function,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B)

temp= coeffs(linear_function,s_A_L);
if size(temp,2)>1
    coefficients_linear_function_column(1,1)=temp(1,2);
else
    coefficients_linear_function_column(1,1)=0*s_A_L;
end

temp= coeffs(linear_function,p_A_L);
if size(temp,2)>1
    coefficients_linear_function_column(2,1)=temp(1,2);
else
    coefficients_linear_function_column(2,1)=0*p_A_L;
end

temp= coeffs(linear_function,s_A_H);
if size(temp,2)>1
    coefficients_linear_function_column(3,1)=temp(1,2);
else
    coefficients_linear_function_column(3,1)=0*s_A_H;
end

temp= coeffs(linear_function,p_A_H);
if size(temp,2)>1
    coefficients_linear_function_column(4,1)=temp(1,2);
else
    coefficients_linear_function_column(4,1)=0*p_A_H;
end

temp= coeffs(linear_function,p_B_LLL);
if size(temp,2)>1
    coefficients_linear_function_column(5,1)=temp(1,2);
else
    coefficients_linear_function_column(5,1)=0*p_B_LLL;
end

temp= coeffs(linear_function,p_B_LHL);
if size(temp,2)>1
    coefficients_linear_function_column(6,1)=temp(1,2);
else
    coefficients_linear_function_column(6,1)=0*p_B_LHL;
end

temp= coeffs(linear_function,p_B_HLL);
if size(temp,2)>1
    coefficients_linear_function_column(7,1)=temp(1,2);
else
    coefficients_linear_function_column(7,1)=0*p_B_HLL;
end

temp= coeffs(linear_function,p_B_HHL);
if size(temp,2)>1
    coefficients_linear_function_column(8,1)=temp(1,2);
else
    coefficients_linear_function_column(8,1)=0*p_B_HHL;
end

temp= coeffs(linear_function,c_A);
if size(temp,2)>1
    coefficients_costs(1,1)=temp(1,2);
else
    coefficients_costs(1,1)=0*c_A;
end

temp= coeffs(linear_function,c_B);
if size(temp,2)>1
    coefficients_costs(2,1)=temp(1,2);
else
    coefficients_costs(2,1)=0*c_B;
end
 
end