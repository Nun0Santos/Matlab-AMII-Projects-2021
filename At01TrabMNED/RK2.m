function y = RK2(f,a,b,n,y0)
%Método Númerico para resolver um PVI: Runge-Kutta de ordem 2
%   y = RK2(f,a,b,n,y0) Método numérico para a resolução de um PVI
%
%INPUT:
%   f - Função da equação diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos ou iterações do método
%   y0 - Valor (condição) Inicial do PVI
%
%OUTPUT: 
%   y - vector das soluções aproximadas
%
%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   26/04/2021  Nuno Santos : a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira : a2020136533@isec.pt
%   26/04/2021  João Almeida :   a2020144466@isec.pt

h = (b-a)/n;
t = a:h:b;
y = zeros(1,n+1);
y(1) = y0;

for i = 1:n
    k1 = h*f(t(i),y(i));
    k2 = h*f(t(i+1),y(i)+k1);
    y(i+1) = y(i)+(k1+k2)/2;
end

end