clear
clc
a = [1 1 1.5 1 1.5 0 0 0 0 0; 0 1 0.01 0.51 1.5 0.5 0 0 0 0; 2.9 1 2 1 1 0 5 0 0 0; 9 1 0.2 1 1 0 0 1.5 0 0; 1 0 2 0 0 1 1 1 0 2; 0 1 0 0 -2 0 1 -1 1 1; 1 0 2 0 0 0 1 1 1 0; 0 1 0 0 2 0 1 1 1 -1; 0 0 1 0 2 1 -1 0 -1 -1; 0 1 0 0 2 0 1 0 1 1];
b = [4 -3 1 -1 -1 0 -1 1 3 -2];
ca = a;
cb = b;
n = length(b);
o = [1 2 3 4 5 6 7 8 9 10];

% ----- PROCURANDO MAIOR EM MODULO -----
for k=1:n-1  %linha pivo e coef pivo
  maior = abs(a(o(k),k));
  p = k;
  for i=k+1:n
    if (abs(a(o(i),k)) > maior)
      maior = abs(a(o(i),k));
      p = i; %linha do maior em modulo
    end
  end

% ----- TROCANDO LINHAS APENAS NO VETOR O------
  if (p>k)
    aux = o(k);
    o(k) = o(p);
    o(p) = aux;
  end

% ---- TRIANGULARIZACAO -----
  for i=k+1:n
    mult = a(o(i),k)/a(o(k),k);
    for j=k:n
      a(o(i),j)=a(o(i),j)-mult*a(o(k),j);
    end
    b(o(i))=b(o(i))-mult*b(o(k));
  end
end
a
b
% ----- RETROSUBSTITUIÇÃO ------
x(n)=b(o(n))/a(o(n),n);
for i=n-1:-1:1
  soma=0;
  for j=i+1:n
    soma=soma+a(o(i),j)*x(j);
  end
  x(i)=(b(o(i))-soma)/a(o(i),i);
end
x
o
% ---- RESIDUO -----
r = abs(cb'-ca*x')



