Struktura  terminowa stóp procentowych
======================================

Podstawowe zależności
---------------------

Jeśli mamy do czynienie z instrumentem dłużnym generującym określoną
stopę zwrotu w określonym czasie . I jeśli ponadto inwestujemy kwotę
inwestycji na końcu każdego etapu na okres następny, w którym stopa
procentowa może być inna albo taka sama to mamy do czynienia z
inwestycją wieloetapową.

Jeśli zdefiniujemy zwrot z inwestycji jako:

.. math::
    :label: zwrotR

    R = \frac{S - S_0}{S_0},

 
gdzie: :math:`S` końcowa wartość naszego portfela a :math:`S_0` to
jego wartość początkowa.

Jeśli w portfelu mamy instrument dłużny (instrument stałego dochodu) o
stopie procentowej w danym okresie :math:`i` równej :math:`r_i`, to
licząc wartości portfela w kolejnych etapach inwestowania otrzymujemy:

.. math::
   :nowrap:
   
   \begin{alignat*}{4}
     S_1  = &\; S_0 (1+ r_1)  \\
     S_2 = &\; S_1 (1+ r_2) = S_0 (1+ r_1) (1+ r_2) \\
     S_3 = &\; S_2 (1+ r_3) = S_0 (1+ r_1) (1+ r_2) (1+ r_3)\\
     \dots\quad\ &  \\
     S_n = &\; S_{n-1} (1 + r_n) = S_0 (1 + r_1) (1+ r_2) (1+ r_3)\cdots (1+ r_n) 
   \end{alignat*}


Korzystając ze wzoru definiującego :eq:`zwrotR` widać, że zwrot z takiej
wieloetapowej inwestycji wynosi:

.. math::
   :label: zwrotRn

   R = \prod_{i=1}^n (1+ r_i) - 1


Stopa średnia roczna to wielkość stopy, która stosowana do każdego
roku inwestycji da końcowy wynik równy :math:`R`. Czyli: 

.. math::
   :label: srednia_roczna_pre

   (r_s+1)^n  = \prod_{i=1}^n (1+ r_i) 


Stąd wynika wzór:

.. math::
   :label: srednia_roczna

   r_s = \sqrt[n]{\prod_{i=1}^n (1+ r_i)} - 1


Inaczej :math:`r_s` nosi nazwę średniej geometrycznej stopy zwrotu

Przypominam, że w finansach występuję wiele rodzajów
"średnich". Należy zawsze pamiętać jak się je liczy i wiedzieć, że nie
są to raczej średnie arytmetyczne. Średnia arytmetyczna w przypadku
wieloetapowej inwestycji w instrument stałego dochodu była by średnia
arytmetyczną gdyby w każdym etapie inwestowana była ta sama wartość
portfela. Dla takich samych ri takich samych i średnia geometryczna
stopa zwrotu jest zawsze mniejsza lub równa średniej arytmetycznej
stopie zwrotu.  


Krzywa dochodowości
-------------------  

Związek miedzy dochodowościami obligacji a czasem ich życia określa
krzywa zwana krzywa dochodowości.  Konstrukcja krzywej dochodowości
jest tylko łatwa jeśli dysponujemy jednorodnymi obligacjami o różnych
datach zapadalności pozwalających na konstrukcje tejże
krzywej. Powinien ten zbiór danych zawierać wszystkie kolejne daty
zapadalności.  Największy problem to właśnie założenie jednorodnego
zbioru obligacji o różnej zapadalności. Obligacje raczej nie są
jednorodne czyli np. charakteryzować się tym samym ryzykiem
charakteryzować się dużą i taka samą płynnością.  Z tych przykładowo
powodów strukturę terminowa stóp procentowych określa się na podstawie
krzywej dochodowości dla wybranych obligacji, przykładowo o tym samym
oprocentowaniu, czy też biorąc pod uwagę stopę zwrotu do zapadalności.


.. figure:: figs/krzywa_dochodowosci.png
   :align: center
   :figwidth: 340px
   :height: 230px

   Krzywa rentowności

Stopy spot to stopy oprocentowania pożyczek dzisiaj: rok, 2 lata,
5lat, 10 lat, etc...  Krzywa rentowności to pokazane aktualnych stóp
spot dla różnych zapadalności.  Z kształtu krzywej rentowności
inwestorzy optymalizują swe działania inwestycyjne. Decydują czy
lepiej reinwestować środki na okresy krótsze czy dłuższe.  

Wyliczanie stop forward ilustrować może poniższy przykład.
Przykładowo przyjmijmy hipotetycznie istniejące instrumenty dłużne,
które obserwujemy na hipotetycznym rynku.  Instrumenty te są
instrumentami emitowanymi przez Skarb Państwa (hipotetycznego) więc
możemy przyjąć, że są to instrumenty o minimalnym ryzyku na naszym
rynku i ryzyku podobnym.  Przyjmijmy ponadto, że instrumenty te mają
wartość nominalna jednakową – powiedzmy 100 000.  

Tak więc bierzemy pod uwagę:

1.  Jednoroczny bon skarbowy sprzedawany na rynku po 86 956. 
2.  Skarbowa obligacje dwuletnią wypłacającą kupon 15.5% i handlowana po 100\ 060 
3.  Trzyletnią obligacje skarbową o kuponie 16.2% handlowana po 100680. 

Aby określić stopy forward postępuje się następująco. Z danych bonu
skarbowego wyliczamy stopę roczną:

.. math::

   86956 = \frac{100 000}{1+r_1} 


stąd :math:`r_1 = 15\%`. 

Z danych obligacji dwuletniej wyliczamy stopę roczną za drugi rok -
:math:`r_2`:

.. math::

   100060 = \frac{15500}{ 1 + r_1} + \frac{115500}{( 1+r_1)(1+r_2)} 

stad :math:`r_2 =16\%`.


Z danych obligacji trzyletniej otrzymujemy: 

.. math::

   100680 = \frac{16200}{1 + r_1} + \frac{16200}{ (1+r_1) (1+r_2)} + \frac{116200}{(1+r_1)(1+r_2)(1+r_3)}

Stad :math:`r_3 = 17\%`.  


Sprawdźmy te obliczenia wykorzystując Sage:

.. sagecellserver::

   var('r1,r2,r3')
   s =solve( [86956  == 100000./(1+r1),\
        100060 == 15500/(1 + r1)+115500/((1+r1)*(1+r2)),\
        100680 == 16200/(1+r1)+16200/((1+r1)*(1+r2))+116200/((1+r1)*(1+r2)*(1+r3)) ] ,[r1,r2,r3] )

   print map(lambda x:x.rhs().n()*100,s[0])


Przy czym należy podkreślić, że :math:`r_2` to stopa roczna dla roku
drugiego życia obligacji, a :math:`r_3` to roczna stopa oprocentowania
"za dwa lata" na rok trzeci.
 
W przypadku stóp  forward użytecznym jest następujące oznaczenie:

Stopy forward to oprocentowanie dla pożyczki zawartej w przyszłości - :math:`F`: 


  - :math:`F(1,1)`  oprocentowanie rocznej pożyczki zawartej w terminie 1 rok od dziś 
  - :math:`F(1,2)`  oprocentowanie 2 letniej pożyczki zawartej w  terminie rok od  dziś. 
  - :math:`F(2,1)`  oprocentowanie jedno rocznej pożyczki zawartej w terminie 2 lat od dziś 


Stopa spot  to szczególny przypadek - :math:`S(1) = F(0,1)`

Zasadę tę  ilustruje  rysunek poniżej:

.. figure:: figs/stopy_fwd_ML.png 
   :align: center
   :figwidth: 240px
   :width: 220px

   Zbiór stóp forward i związanych z nimi stóp "spot".


Przyjmijmy, że na rynku znajdujemy dwuletni bon skarbowy A o
rentowności rocznej 3.52% a bon roczny B, ma roczną rentowność równa
3.12%. Aby określić stopę forward :math:`F(1,1)`, widzimy że
inwestując w bon A jednostkę pieniędzy otrzymujemy:

.. math::

   \text{Bon A: }\; ( 1 + 0.0352)( 1 + 0.0352)= 1.0716 

Czyli ok. 7.2% zwrotu. Inwestując natomiast w bon B na rok jednostkę
pieniędzy inwestujemy ja na 3.15% ale możemy otrzymany wynik
reinwestować na kolejny rok na stopę :math:`F(1.1)`. Zakładając, że
na rynku nie istnieje możliwość arbitrażu, to obie te strategie muszą
dać ten sam efekt inwestycji. Czyli: 

.. math::

   (1+ 0.0312) ( 1+ F(1.1)) = ( 1 +0.0352)( 1 + 0.0352) 

Stąd:

.. math::
   ( 1 + F(1.1,) )= ( 1 + 0.0352)( 1 + 0.0352)/1.0312 = 1.0392 

Czyli :math:`F(1.1)` musi wynosić 3.92 % rocznie.

Można postąpić również odwrotnie. Znając zestaw stóp forward możemy
wyliczyć stopy spot.  Załóżmy, że stopa :math:`F(0.1)` wynosi 2.5% a
:math:`F(1.1)`) wynosi 3.2%. Należy wyliczyć :math:`S(2)`.
Postępujemy tak jak poprzednio i porównujemy do siebie dwie możliwe
strategie inwestycyjne.  Inwestujemy jednostkę pieniężną albo:

1) Na  dwa lata przy stopie  :math:`S(2)`, co daje: 
 
    .. math::

        (1+ S(2))( 1+ S(2))= (1+ S(2))^2 


2) Inwestujemy jednostkę pieniężną na pierwszy rok przy stopie
   :math:`F(0.1)` a następnie efekt inwestycji reinwestujemy na
   kolejny rok przy stopie :math:`F(1.1)` czyli:

    .. math::
        
       (1+ 0.02)(1+ 0.032)=1.05264 
    
    około 5.27% a to powinno być równe inwestycji 1. 

Innymi słowy:

.. math::

   (1+ S(2))^22 = (1+ 0.02)(1+ 0.032). 

Stąd

.. math::

   (1+S(2)) = \frac{1}{2}[(1+ 0.02)(1+0.032)]= 1.027

czyli :math:`S(2) = 2.7\%`. 

W ostatnim przykładzie wyliczona stopa spot jest średnia geometryczna
stóp zwrotu forward.  Czego należało się spodziewać, mając na uwadze
wzór :eq:`srednia_roczna`.  


Wiedząc, że:
 
.. math::

   \sqrt[n]{a_1 a_2\dots a_n} \le \frac{1}{n}\sum_{i=1}^n a_i


Możemy używać średniej matematycznej szacowania średniej
geometrycznej. 


Modelowanie ewolucji stóp procentowych
--------------------------------------

Modele dyskretne (drzewa binarne)
+++++++++++++++++++++++++++++++++

Stopa forward to stopa terminowa czyli "pojawiająca" się za pewien
czas. Można interpretować ją jako ewolucje stopy spot. Gdyby nie
istniała niepewność na rynku co do scenariusza dalszego jego rozwoju
to stopa foward byłaby nielosowa i z góry znana. Jednakże istniejąca
niepewność przyszłości zmusza nas do ustawicznego modelowania ewolucji
stopy forward jako procesu stochastycznego.

Stopy forward pokazują ewolucje stóp na rynku. Więc należy tą ewolucje
śledzić mając na uwadze efektywne zarządzanie portfelem instrumentów
dłużnych. Temu celowi służy tworzenie modelu aby wyjaśnić ruch stóp
forward. Następnie wyliczamy krzywą rentowności wynikającą ze stóp
forward i porównujemy ja z krzywą stóp aktualnych.  Modelowanie polega
przykładowo na stworzeniu modelu dwumiennego (stopa zmieniać się może
okresowo poprzez wzrost lub zmalenie) albo modelu trójmiennego, gdy
wartośc stopy w kolejnym okresie czasu z określonym
prawdopodobieństwem zmienia się w górę lub w dół albo nie zmienia się
w ogóle.

Rozważając modele dwumienne, należy odróżnić dwa zasadnicze typu -
drzewa rekombinujące i nierekombinujące. Te pierwsze mają w każdym
kolejnym okresię dokładnie o jedną unikalną wartość stopy procentowej
więcej. Te drugie mają po każdym okresie dwa razy więcej wartości
stopy procentowej, co implikuje wzrost liczby stanów z liczbą okresów
jak :math:`2^n`.

.. _przyklad_drzewa:

Rozważmy przykład drzewa binarnego rekombinującego. Niech w chwili
:math:`t=0` stopa procentowa wynosi :math:`4\%`.  Czyli :math:`F(0,1)
= S(1)`. Stopa może ewoluować w czasie i przyjmujęmy regułę, że z
prawdopodobieństwem :math:`50\%` może wzrosnąć o :math:`0.7\%` do
wartości :math:`4.7\%` albo spaść o :math:`0.2\%` do wartość
:math:`3.8\%` z tym samym prawdopodobieństwem :math:`50\%`.
Graficznie przedstawiamy to w następujący sposób:


.. figure:: figs/tree1.png
   :align: center
   :figwidth: 240px
   :height: 220px

   Ewolucja stopy procentowej po pierwszym roku w modelu binarnym.

Mamy więc dwa scenariusze, nazywane tutaj ścieżkami: 

 	
Ścieżka 1, 
    w której stopa wzrasta ze skumulowanym zwrotem :math:`1.04\times1.047 = 1.089`


Ścieżka 2, 
    w której stopa maleje  ze skumulowanym zwrotem :math:`1.04\times1.038 = 1.08`.


Skumulowany średni zwrot z dwu lat będzie średnią arytmetyczną z dwóch
powyższych scenariuszy i wynosi:

.. math::

   \frac{1}{2} \text{Ścieżka 1} + \frac{1}{2} \text{Ścieżka 2} = \frac{1}{2} 1.09 + \frac{1}{2} 1.079 = 1.085 


czyli :math:`8.5\%.` Zanualizowany zwrot czyli :math:`S(2)` jest równy:


.. math::

   1.085\frac{1}{2} = 1.042 

czyli :math:`4.2\%`.


W kolejnym okresie mamy trzy stany i cztery różne scenariusze dojścia do nich:


.. figure:: figs/tree2.png
   :align: center
   :figwidth: 280px
   :height: 227px

   Ewolucja stopy procentowej po drugim roku w modelu binarnym.


Policzmy rentowności.


 - Ścieżka 1 
    :math:`1.04\times1.047\times1.054 = 1.148 \text{ czyli } 14.8 \%` 

 - Ścieżka 2 
    :math:`1.04\times1.047\times1.045 = 1.138 \text{ czyli }13.8 \%`

 - Ścieżka 3 
    :math:`1.04\times1.038\times1.045 = 1.128 \text{ czyli }12.8 \%`

 - Ścieżka 4 
    :math:`1.04\times1.038\times1.036 = 1.118 \text{ czyli } 11.8 \%`


Skumulowany zwrot po trzech okresach (np. latach) wynosi:

.. math::

   \frac{1}{2} \langle 1.148 + 1.138 + 1.128 + 0.25 x 1.118 \rangle = 1.133

Zanualizowany zwrot po trzech okresach :math:`S(3)` wynosi:

.. math::

   \sqrt[3]{ 1.128} - 1 = S(3) \text{ czyli  około } 4.25\%



W podobny sposób dla dowolnych ścieżek możemy obliczać odpowiednie
stopy. Jednak ze względu na wykładniczy wzrost liczby ścieżek z liczbą
okresów warto zastosować komputer do obliczenia średniej po
ścieżkach. Spróbujmy więc zaimplementować powyższy algorytm
korzystając z systemu Sage.

Po pierwsze zdefiniujmy sobie procedurę, która będzie generowała
drzewo binarne. W pierwszej wersji możemy założyć, że drzewo nie
będzie rekombinowało, czyli liczba gałęzi po :math:`n` iteracjach
będzie wynosiła :math:`2^n`. Nazwijmy ta funkcję :code:`gen_all()`:


.. sagecellserver::

    def gen_all(niter,SP = 4.0,q=0.175,delta1=None,delta2=None):
        SP = [[SP]]

        for i in range(niter):
            tmp = []
            for s in SP[-1]:
                if delta1==None or delta2==None:
                    tmp+= [ (1+q)*s, s/(1+q) ]
                else:    
                    tmp+= [ s+delta1, s-delta2 ]
            SP.append(tmp)
        return SP

.. admonition:: Opis programu

   Funkcja :code:`gen_all` generuje zadaną przez pierwszy parametr
   liczbę poziomów drzewa binarnego. Startujemy z wartości
   :code:`SP`. Z danej wartości w poprzednim okresie są generowane
   dwie nowe. Zgodnie z regułą addytywną: :code:`s+delta1, s-delta2` a
   z multiplikatywną mamy :code:`(1+q)*s, s/(1+q)`. Reguła
   multiplikatywna jest domyśna, a funkcja użyje wersji addytynej
   jesli na wejsciu podamy parametry :code:`delta1,delta2`. Struktura
   danych w której będziemy przechowywać dane wyjsciowe (drzewo
   binarne) to listą wartości stopy procentowej w każdym okresie
   (czyli zagnieżdżona lista list). 

    
Możemy też zaimplementować procedurę, tworzącą drzewo w którym
wszystkie wartości rekombinują, tzn. będziemy mieli :math:`n+1`
wartosci w :math:`n`-tym okresie. Mamy dwie proste reguły prowadzące
do tego typu drzew. Jedną jest odejmowanie i dodawania tych samych
wartości, co ma to jednak tę wadę, że możemy wygenerować ujemną stopę
procentową. Drugą możliwością jest mnożenie wartości stopy procentowej
w przypadku wzrostu przez pewną liczbę większą od jednego, a w
przypadku zmalenia przez jej odwrotność. Łatwo się przekonać, że takie


.. sagecellserver::

    def gen_recombining(niter,SP = 4.0,q=0.175,delta1=None,delta2=None):
        SP = [[SP]]

        for i in range(niter):
            tmp = []
            for s in SP[-1]:
                if delta1==None or delta2==None:
                    tmp+= [ (1+q)*s]
                else:    
                    tmp+= [ s+delta1]

            if delta1==None or delta2==None:
                tmp+= [ s/(1+q)]
            else:    
                tmp+= [ s-delta2]
            SP.append(tmp)
        return SP

.. admonition:: Opis programu

    Funkcja :code:`gen_recombining` ma ten sam wywołania jak
    :code:`gen_all`. Różnica polega na tym, że liczba możliwych stóp
    procentowych w n-tym okresie wynosi :math:`n+1` a nie :math:`2 n`. 

Najlepiej przyjrzeć się na przykładzie jak procedury te generują te
dane startując od stopy procentowej np. wywołanie:


.. code-block:: python

   print gen_all(3)

daje:

.. math::

    \left[4.0\right]
    \left[4.7, 3.4\right]
    \left[5.5, 4.0, 4.0, 2.9\right]
    \left[6.5, 4.7, 4.7, 3.4, 4.7, 3.4, 3.4, 2.5\right]

a wywołanie:

.. code-block:: python

   print gen_recombining(3)


.. math::

    \left[4.0\right]
    \left[4.7, 3.4\right]
    \left[5.5, 4.0, 2.9\right]
    \left[6.5, 4.7, 3.4, 2.5\right]


Do wizualizacji danych możemy wykorzystać również system Sage i
przykładowa procedura rysującą drzewa w obu formatach ma następującą
postać:

.. only:: latex

   .. code-block:: python


      def plot_tree(SP):
          plt = point( (0,SP[0][0]),size=244,color='gray',alpha=0.2,zorder=0)

          if len(SP) == len(SP[-1]):
              for l,prices in enumerate(SP):
                  for i,p in enumerate(prices):
                      if l>0:
                          plt+=point2d( (l,p),size=244,\
                           color='gray',alpha=0.2,zorder=0,faceted=True )
                          plt+= text("%0.1f"%p,(l,p),color='black',\
                           figsize=(5,3))

              for l in range(len(SP)-1):
                  for i in range(l+1):
                      plt+=arrow2d( (l,SP[l][i]),(l+1,SP[l+1][i]),\
                        arrowshorten=16)
                      plt+=arrow2d( (l,SP[l][i]),(l+1,SP[l+1][i+1]),\
                         arrowshorten=16)
          else:
              for l,prices in enumerate(SP):
                  for i,p in enumerate(prices):
                      if l>0:
                          plt+=arrow2d( (l-1,SP[l-1][int(i/2)]),(l,p),\
                            arrowshorten=16)
                          plt+=point2d( (l,p),size=244,color='gray',\
                            alpha=0.2,zorder=0,faceted=True )
                          plt+= text("%0.1f"%p,(l,p),color='black',\
                            figsize=(5,3))
          plt.axes_labels(["rok","stopa procentowa [%]"])
          plt.axes_range(xmin=-.2, xmax = len(SP)-1+0.2,\
           ymin=0,ymax=SP[-1][0]+1)
          return plt


.. only:: html

   .. sagecellserver::

      def plot_tree(SP):
          plt = point( (0,SP[0][0]),size=244,color='gray',alpha=0.2,zorder=0)

          if len(SP) == len(SP[-1]):
              for l,prices in enumerate(SP):
                  for i,p in enumerate(prices):
                      if l>0:
                          plt+=point2d( (l,p),size=244,\
                           color='gray',alpha=0.2,zorder=0,faceted=True )
                          plt+= text("%0.1f"%p,(l,p),color='black',\
                           figsize=(5,3))

              for l in range(len(SP)-1):
                  for i in range(l+1):
                      plt+=arrow2d( (l,SP[l][i]),(l+1,SP[l+1][i]),\
                        arrowshorten=16)
                      plt+=arrow2d( (l,SP[l][i]),(l+1,SP[l+1][i+1]),\
                         arrowshorten=16)
          else:
              for l,prices in enumerate(SP):
                  for i,p in enumerate(prices):
                      if l>0:
                          plt+=arrow2d( (l-1,SP[l-1][int(i/2)]),(l,p),\
                            arrowshorten=16)
                          plt+=point2d( (l,p),size=244,color='gray',\
                            alpha=0.2,zorder=0,faceted=True )
                          plt+= text("%0.1f"%p,(l,p),color='black',\
                            figsize=(5,3))
          plt.axes_labels(["rok","stopa procentowa [%]"])
          plt.axes_range(xmin=-.2, xmax = len(SP)-1+0.2,\
           ymin=0,ymax=SP[-1][0]+1)
          return plt



Teraz możemy narysować drzewo do np. czwartej generacji:


.. sagecellserver::

   plot_tree(gen_recombining(4)),plot_tree(gen_all(4))


Zauważmy, że w pełnym drzewie binarnym mamy w :math:`n`-tym okresie
:math:`2^n` wartości, z których tylko :math:`n` jest liczbowo
różnych. Procedura rysująca wszystkie wartości, rysuje stopy
procentowe w kółkach o kolorze jasnoszarym, przy czym jeżeli
narysujemy więcej niż raz jasnoszare kółko jedno na drugim to kolor
będzie ciemniejszy (związane jest to z opcją alpha=0.2, która określa
stopnień przezroczystości koloru). Wynika z tego, że im ciemniejszy
kolor tym więcej elementów pełnego drzewa dwumiennego ma daną
wartość. Zobaczmy na poniższym rysunku:


.. figure:: figs/tree4.png
   :align: center
   :figwidth: 240px
   :height: 227px

   Ewolucja stopy procentowej.

W pełnym drzewie binarnym istnieje tylko jedna ścieżką realizująca
każdą gałąź. Wobec tego można powiedzieć, że liczba ścieżek
realizujących stopę procentową jest proporcjonalna do odcienia na
powyższym rysunku. Wyraźnie widzimy, że skrajne wartości są dużo mniej
prawdopodobne od tych w środku.

Obliczanie wartości średnich w modelu dwumiennym wiąże się z
sumowaniem po wszystkich ścieżkach. Ponieważ rozważania dla stóp
procentowych mają sens dla kilku - maksymalnie kilkunastu lat to można
sobie pozwolić na dokładne wykonanie takich obliczeń. Liczba
składników sum będzie np. :math:`65536` dla :math:`n=16`.


Mając drzewo binarne, możemy policzyć średnią zanulizowaną stopę
procentową. Algorytm, można zapisać w trzech liniach:

.. code-block:: python

   SP = gen_recombining(N,delta1=0.7,delta2=0.2)
   all_paths = map(lambda x:[0]+np.cumsum(x).tolist(), CartesianProduct(*( N*[[0,1]]) ).list() )
   mean( [prod([(1+0.01*SP[i][p]) for i,p in enumerate(path_)]) for path_ in all_paths] ) 


.. admonition:: Opis programu

   Chcemy policzyć średnią z iloczynów :math:`\prod_{i=1}^{n} (1+r_i)`
   po wszystkich ścieżkach. Postępujęmy w następujący sposób:

   - **linia 1:** - generujemy drzewo (rekombinujące) wszystkich wartości stóp:
     :code:`SP = gen_recombining(N,...`
   - **linia 2:** - wyliczamy wszystkie ścieżki w formacie
     np. [0,1,2,1,...], gdzie kolejne liczby oznaczają pozycję danej
     stopy w odpowiednim okresie. W przykładzie, w trzecim okresie
     mamy stopę numer "2" na liście stóp. Obliczenia te wyokrzystują
     iloczyn kartezjanski, który w Sage mamy w postaci funkcji np. dla
     dwóch list: :code:`CartesianProduct([0,1],[0,1])`
  
      - zauważmy, że pierwsza gwiazdka "rozpakowywuje argumenty" z :code:`N*[[0,1]]`.

      - użycie :code:`np.cumsum` umożliwia z zapisu względnych ruchów
        stopy w okresach :code:`[0,1,0,0,1]` do jej bezwględnych
        indeksów wartości :code:`[0, 1, 1, 1, 2]`.
 
   - **linia 3:** -  mając już zapis każdej ścieżki w powyższym formacie, wykonujemy
     odpowiedni iloczyn oraz uśredniamy wynik po ścieżkach


Możemy sprawdzić czy powyższy program obliczy poprawnie testując do na
przeliczonym w uprzendnio :ref:`przykładzie <_przyklad_drzewa>`:


.. sagecellserver::

   import numpy as np
   N = 2
   try:
       SP = gen_recombining(N,delta1=0.7,delta2=0.2)
       all_paths = map(lambda x:[0]+np.cumsum(x).tolist(), CartesianProduct(*( N*[[0,1]]) ).list() )
       R = mean( [prod([(1+0.01*SP[i][p]) for i,p in enumerate(path_)]) for path_ in all_paths] )
       print "Srednia zannualizowana stopa wynosi:", (R^(1/(N+1)) - 1)*100
   except:
       print "załaduj definicję get_recombining"


Wykonując powyższą komórkę powinniśmy otrzymać wynik taki sam jak w
rachunkach na piechotę. Po co nam więc algoryym? Rachunków na piechotę
nie da się przeprowadzać dla zbyt dużej ilości okresów, bo liczba
scieżek rośnie wykładniczo jak :math:`2^N`! A w następnym rozdziale
będziemy potrzebowali wyników dla :math:`N>10`.


Krzywa dochodowości
-------------------

Mając napisany algorytm do oblicznania średnie zanualizowanej stopy,
możemy policzyć krzywą dochodowości w modelu dwumiennym. W tym celu
liczymy, zakładając ewolucję stopy zgodnie z regułami- 
multyplikatywną lub addytywną, stopę :math:`r_s` dla różnych ilości
okresów i nanosimy otrzymane wartości na wykresię
:math:`r_s(N)`. Mamy:

.. figure:: figs/krzywa_dochodowosci1.png
   :align: center
   :figwidth: 340px
   :height: 230px

   Krzywa rentowności dla ewolucji stopy procentowej modelowanej
   procesem binarnym


Implementacja algorytmu w zasadzie polega na umieszczeniu kodu
liczącego zanulizowaną średnią stopę po :math:`N` okresach wewnątrz
funkcji w której parametrem będzie właśnie liczba okresów.


.. admonition:: Poeksperymentuj sam

   W funkcji :code:`forward_rate(N = 2,**kpars)` oznaczenie
   :code:`**kpars` umożliwia przekazanie dowolnej ilości argumentów,
   które będą potem przekazane dalej do
   :code:`gen_recombining(N,**kpars)`. Można na przykład zastosować
   wywołanie z drzewem addytywnym. Jak wtedy będzie wyglądała ta
   krzywa?

.. sagecellserver::


    def forward_rate(N = 2,**kpars):

        SP = gen_recombining(N,**kpars)
        all_paths = map(lambda x:[0]+np.cumsum(x).tolist(),CartesianProduct(*( N*[[0,1]]) ).list() )

        r_avg = mean( [prod([(1+0.01*SP[i][p]) for i,p in enumerate(path_)]) for path_ in all_paths] ) 
        rs  =((r_avg)^(1/(N+1))-1)*100
        return  rs


    point( [(i,forward_rate(i,q=0.1)) for i in range(12)],figsize=5)+\
     point( [(i,forward_rate(i,q=0.2)) for i in range(12)],color='red')








Modele ciągłe
+++++++++++++

Ewolucję stopy procentowej można też modelować procesem losowym z
czasem ciągłym. Modele takie dzielą się na:

 - jednofaktorowe: takie w których mamy jedno równanie stochastyczne 
 - wielofaktorowe: mamy dwa lub więcej równań stochastycznych

Jednym z podstawowych modeli jednofaktorowych jest tzw. model
Vasicek'a, w którym chwilowa stopa zwrotu dana jest równaniem:

.. math::
   :label: vasicek_sde

   \frac{dr}{dt} = \lambda \left( \mu  - r(t) \right) + \sigma \xi(t),


gdzie: 

 - :math:`r(t)` - chwilowa stopa zwrotu
 - :math:`\lambda` - prędkość relaksacji
 - :math:`\mu` -   wartość asyptotyczna procesu
 - :math:`\xi(t)` - biały szum Gaussowski z funkcją korelacji: 
   :math:`\langle x(t) x(t+\tau) \rangle = \delta(\tau)`
   
.. note:: Proces ten jest też zwany procesem Ornsteina-Uhlenbecka.

Możemy sobie łatwo skonstruować algorytm, który będzie symulował to
równanie stochastyczne. Ponieważ potrzebujemy wiele realizacji procesu
losowego, najlepiej będzie symulować jednocześnie :math:`M`
tajektorii. 

Poniższy kod wykonuje :math:`N` kroków symulacji:


.. sagecellserver::

    import numpy as np

    N=10000;
    M=10000;
    T=100.;
    h=T/N;

    S0=8
    sigma=0.2
    k = 0.1
    theta = 6.0
    x=np.zeros((M,N))
    x[:,0]=S0*np.ones(M)
    for i in range(1,N):
      x[:,i]=x[:,i-1] + k*(theta-x[:,i-1])*h + sigma*np.sqrt(h)*np.random.randn(M)

    line( zip(time,x[13,:]) ) + point(zip(time[::100],x[13,::100]),color='red')
    (np.prod(1+np.average(x[:,::100],axis=0)*0.01)**(0.1)-1)*100

    rav  = np.average(x[:,::100],axis=0)*0.01

    point([(n,100*(np.prod(1+rav[:n])**(1.0/n)-1)) for n in range(1,100+1)])


.. admonition:: Opis programu

    Wykorzystujemy stochastyczny algorytm Eulera w którym całka z
    białego szumu jest równa:

    .. math::
             \int_0^h \xi(t) dt = \sqrt(h) N(0,1),

    gdzie :math:`N(0,1)` jest zmienną losową o rozkładzie Gaussowskim
    ze średnią zero i wariancją :math:`1`.

    Inicjalizujemy macierz w której będziemy przechowywać wszystkie
    :math:`N` kroków dla :math:`M` trajektorii. 

   



