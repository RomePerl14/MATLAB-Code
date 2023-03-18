function[t, y] = imprvdmyeuler(f, tinit, yinit, b, n)

 h = (b - tinit)/n;

 t = zeros(n+1, 1);
 y = zeros(n+1, 1);

 t(1) = tinit;
 y(1) = yinit;
 
 for i = 1:n
     yprime = f( t(i), y(i) );
     t(i+1) = t(i) + h;
     y(i+1) = y(i) + h/2 * ( yprime + f( t(i+1), y(i)+(h*yprime) ) );
 end