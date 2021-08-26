function y = MEuler(f,a,b,n,y0)
%MEuler   Método Númerico para resolver um PVI/EDO: Método de Euler
%   y = MEuler(f,a,b,n,y0) Método numérico para a resolução de um PVI
%
%   y'=f(t,y), t=[a,b], y(a)=y0
%   y(i+1)=y(i)+hf(t(i),y(i)), i=0,1,2,...,n
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
y = zeros (1,n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i)+h*f(t(i),y(i));
end

end

