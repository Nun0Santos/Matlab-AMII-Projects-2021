function [t,u,v] = NEulerSED(f,g,a,b,n,u0,v0)  
%NEulerSED   Método Númerico para resolver um Sistema se SED/PVI: Método de Euler
%   y = NEulerSED(f,g,a,b,n,u0,v0) Método numérico para a resolução de um PVI
%
%INPUT:
%   f - 1ª Função do sistema de equações diferenciais, em v, u e t
%   g - 2ª Função do sistema de equações diferenciais, em v, u e t
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos ou iterações do método
%   u0 - 1º Valor (condição) Inicial do PVI, quando u=0
%   v0 - 2º Valor (condição) Inicial do PVI, quando v=0
%
%OUTPUT: 
%   t - vector do X, dos passos de "a" a "b"
%   u - vector das soluções apróximadas dos deslocamentos
%   v - vector das soluções aproximadas das velocidades
%
%   15/04/2021  Arménio Correia   armenioc@isec.pt
%   9/05/2021  João Almeida     a2020144466@isec.pt
%   9/05/2021  Nuno Santos      a2019110035@isec.pt
%   9/05/2021  Pedro Nogueira   a2020136533@isec.pt
%%

h = (b-a)/n;
t = a:h:b;
u = zeros(1,n+1);
v = zeros(1,n+1);
u(1) = u0;
v(1) = v0;
for i=1:n
    u(i+1) = u(i)+h*f(t(i),u(i),v(i));
    v(i+1) = v(i)+h*g(t(i),u(i),v(i));    
end

end

