Dodatek: Daty
-------------


Jak obliczyć ilość dni pomiędzy dwoma datami? 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Jedną z możliwości jest konwersja daty to czasu `Juliańskiego
<http://pl.wikipedia.org/wiki/Data_julia%C5%84ska>`_. Jest to liczba
dni, która upłynęła od tóra upłynęła od 1 stycznia roku 4713 p.n.e.,
według kalendarza juliańskiego

.. sagecellserver::

   def julian_days((Y,M,D)):
       a=floor((14-M)/12)
       y=Y+4800-a
       m=M+12*a-3
       return D + floor((153*m+2)/5) + 365*y + floor(y/4) - floor(y/100) + floor(y/400)-32045

   data1,data2 = (1980,10,31), (1989,5,1)

   print julian_days(data2)-julian_days(data1 )


Większość systemów komputerowych ma wbudowaną funkcję pozwalającą na
obliczanie ilości dni pomiędzy dwoma datami. Na przykład w języku
python można wykorzystac moduł `datetime` w następujący sposób:

.. sagecellserver::

   from datetime import date
   try:
       print date(*data2)-date(*data1)
   except:
       print "Wczytaj poprzednią komórkę!"


Wyliczmy jeszcze ile mamy dni pracujących począwszy od 1 października
2014 do 17 lutego 2015 - czyli w semestrze zimowym:

.. sagecellserver::

   from datetime import date,timedelta
   data1,data2 = (2014,10,1), (2015,2,17)

   d = date(*data1)
   c=0
   
   while d<=date(*data2):
       if  d.weekday()<5:
           print d,d.strftime("%A")
       d += timedelta(days=int(1))
       c+=1
   print c


.. admonition:: Poeksperymentuj z komputerem!

   
   Ile wtorków będzie w tym semestrze?
