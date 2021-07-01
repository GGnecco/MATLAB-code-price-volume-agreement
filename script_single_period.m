Delta1=rand
Delta2=rand
Delta3=rand
Delta4=rand

A=[Delta1 Delta2 Delta3 Delta4;
   Delta1 Delta2 Delta3 0;
   Delta1 Delta2 0 0;
   Delta1 0 0 0];

a4=rand
a3=a4+rand
a2=a3+rand
a1=a2+rand

a=[a1 a2 a3 a4]';

x=A^(-1)*a



