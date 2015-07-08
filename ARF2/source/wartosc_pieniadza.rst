Wartość pieniądza w czasie, renty i kredyty
===========================================




Na pytanie co wolimy otrzymać: pewną kwotę pieniężną dzisiaj czy za
jakiś czas odpowiadamy, że wolimy otrzymać tę kwotę dziś. Posiadanie
kwoty dziś jest dla nas lepsze niż otrzymanie jej kiedyś w
przyszłości. Można wiec powiedzieć, że pieniądz dzisiaj ma dla nas
większą wartość niż ten sam pieniądz w przyszłości.  Posiadając
pieniądz możemy nim rozporządzać. Możemy kupić coś za nie teraz lub
przeznaczyć je na inny cel. Jeśli udostępnimy je innym to odczuwamy
dyskomfort braku kontroli nad nimi poczucie ryzyka ich utraty. Za ten
dyskomfort spodziewamy się od pożyczającego jakiejś nagrody. Nagroda
powinna być zależna do czasu na jaki je pożyczamy.  Ilość dni jaki
upływa między każdorazowym transferem pieniądza jest istotnym
elementem w finansach.


Jak obliczyć ilość dni pomiędzy dwoma datami?
---------------------------------------------

Jedną z możliwości jest konwersja daty do ilości dni Juliańskch. Jest
to liczba dni, która upłynęła od 1 stycznia roku 4713 p.n.e., według
kalendarza juliańskiego. Metoda i algorytm jest opisana na stronach
Wikipedii: `Data Juliańska
<https://pl.wikipedia.org/wiki/Data_julia%C5%84ska>`_,



Większość systemów komputerowych ma wbudowaną funkcję pozwalającą na
obliczanie ilości dni pomiędzy dwoma datami. Na przykład w języku
python można wykorzystać moduł datetime w następujący sposób: Wyliczmy
jeszcze ile mamy dni pracujących począwszy od 1 października 2014 do
17 lutego 2015 - czyli w semestrze zimowym: Ilość dni pracujących- dni
roboczych ma istotne znaczenie dla różnych obliczeń na rynkach
finansowych. Dlatego umiejętność takich obliczeń jest bardzo istotna.
Przy takich obliczeniach należy pamiętać o różnych kulturach i różnych
dniach świątecznych obowiązujących na świecie jeśli nasze rozliczenia
dotyczą różnych krajów.  Dla obliczeń instrumentów finansowych
przyjmuje się rożne ilości dni w roku. Długość roku kalendarzowego
wymosi 365/366 dni. Taki rok charakteryzuje pewne instrumenty
szczególnie popularne na rynku brytyjskim. Rok o długości 360 dni - to
tzw. rok obrotowy (:math:`12\times30` dni). Taka miara roku popularna
jest na rynku amerykańskim. Instrument finansowy posiada w swym opisie
informacje jaki format dni w roku jest stosowny dla tego instrumentu.


.. admonition:: Poeksperymentuj z komputerem!

   Ile wtorków będzie w tym semestrze?


Linia czasu i strumienie finansowe.
-----------------------------------

Pomocna w obliczeniach matematyki finansowej jest linia czasu. Jest to
odcinek prostej łaczący chwilę aktualną (0) z punktem w przyszłości
lub przeszłości. Odcinek ten dzielony jest zazwyczaj na mniejsze
odcinki obrazujace okresy naliczania odsetek.  Na lini czasu nanosi
się strzałki pionowe ilustrujące strumienie pieniężne opisywanej
operacji korzystając z następującej konwencji: wpływ gotówki to
strumień dodatni a wypływ gotówki to strumień ujemny. linia czsu
ilustrujaca [przepływy pieniężne to prstapodzielona na odcinki
okresów( nad osia kolejne numery okresów , na dole lini- kolejne
przepływy. Ilustarcja ponizej pokazuje przykład lini czasu. 

**przykład**




Wartość przyszła
----------------

Mając w posiadaniu pewną kwotę pieniędzy stajemy przed następującym
wyborem: czy wydać te pieniądze natychmiast i kupić sobie coś czyli
innymi słowy skonsumować je czy też przezornie zachować na późniejszy
czas gdy może będą nam bardziej potrzebne?

Jeśli już nie przeznaczamy ich na konsumpcję, to w dalszym ciągu
myślimy jak je przechować do chwili późniejszej.  Chwila refleksji
podsunie nam dość naturalna obawę czy trzymanie pieniędzy w portfelu
(czy tez innym bezpiecznym miejscu, przykładowa skarpeta czy pod
materacem) to najlepsze sposób na nasze pieniądze bo przecież inflacja
zmniejszać będzie ich wartość. Możemy te pieniądze zainwestować i
spowodować by "pracowały" dla nas. Inwestowanie to oddanie własnych
pieniędzy innym, którzy w zamian za użyczenie naszych pieniędzy na
pewien okres zapłacą nam w postaci odsetek od pożyczonego kapitału i
zwrócą go nam w tej samej kwocie co pożyczyli

Taka inwestycja może być lokata bankowa. Depozyt bankowy jest
instrumentem pozwalającym na zwiększenie wartości naszych pieniędzy w
czasie trwania depozytu.

Wpłacając pewną kwotę P do banku, na rachunek oszczędnościowy. Bank
płaci nam rocznie roczne oprocentowanie w wysokości r .


Procent prosty
--------------

Przykładowo:

Jesli kwote 100 PLN umieścimy na depozycie wypłacajacym 3% rocznie  to:

 - po 1 roku-  otrzymamy odsetki w wysokosci 3 PLN- ktore odprowadzamy na osobne konto
 - po 2 roku otrzymamy odsetki w wysokości 3 PLN - ktore odprowadzamy na osobne konto
 - po 3 roku otrzymamy odsetki w wysokości 3 PLN - ktore odprowadzamy na osobne konto

Po trzech latach dysponujemu kwotą 100 PLN na końcie depozytowym i
kwotą 9 PLN na osobnym koncie.  Taki sposób naliczania odsetek to
procent prosty.


Procent składany
----------------


Procent składany to sposób oprocentowania kapitału, polegający natym,
że odsetki są doliczane do wartości początkowej kapitału i procentują
wraz z nim w kolejnym okresie bazowym. Odsetki otrzymane po upływie
każdego okresu bazowego są natychmiast reinwestowane na tych samych
warunkach co kapitał początkowy (odsetki są kapitalizowane -
dopisywane do kapitału).

Przykładowo wpłacajac kwote P na konto depozytowe (oszczędnościowe)
oprocentowane rocznie procentem r.  Po roku mamy więc:

.. math::

   F= P + Pr = P (1+r)

Po 2 latach zaś jesli po roku pozostawimy w depozycie zainwestowaną
kwotę wraz z odsetkami:

.. math::
  
   F=P(1+r) + F (1+r) r = F(1+r)(1+r) = F (1+r)^2 


Gdzie:

 - F = wartość przyszła
 - P = wartość aktualna ( bieżąca) pieniędzy
 - r = stopa procentowa( oprocentowanie roczne)

po n latach wartość ta będzie wynosić:

.. math::

   F = P (1+r)^n

Albo inaczej przyjmując  bardziej międzynarodowe oznaczenia :

.. math::

    F_V=P_V(1+r)^n
Gdzie:

 * :math:`F_V` nazywa się  wartościa przyszłą (*future value*)
 * :math:`P_V` to wartość bieżąca  pieniedzy (*present value*)
 * :math:`n` ilość lat
 * :math:`r`- stopa  odsetkowa.

W ten sposób wyliczona została wartośc przyszła zainwestowanych
pieniędzy.  Wartość przyszła jest to wartość jaka narośnie z sumy
inwestycji w pewnym okresie czasu jeśli oprocentowana będzie procentem
składanym przy danej stopie odsetek.

 
Wyliczanie wartości przyszłej wymaga poruszania sie w przód po osi
czasu i naliczania odsetek. Taki proces nazywa sie kapitalizacją.

.. admonition:: Przykład 

   Obliczyć składane odsetki od 100 PLN zainwestowanych na 6% przez 3
   lata. Naliczanie odsetek roczne.

    - 1szy rok odsetki wynoszą 6.00. Końcowa  kwota inwestycji wynosi 106.00 PLN. Kwota ta jest inwestowana w całości  na kolejny rok.
    - 2gi rok odsetki wynoszą 6.36. Końcowa  kwota inwestycji wynosi 112.36 PLN. Kwota ta jest inwestowana w całości  na kolejny rok.
    - 3ci rok odsetki wynoszą 6.74. Końcowa  kwota inwestycji wynosi 119.11PLN.
Całkowite odsetki: 19.10 PLN

xxxxxxxIlustarcja jak procent składany zależy od stopy procentowej , czasu i kwoty, etc.xxxxxx

Kapitalizacja, dyskontowanie
----------------------------

Jeśli transformujemy 1PLN dzisiaj, w jej równoważność w przyszłości,
to ten proces nazywamy kapitalizacją, natomiast, jesli transformujemy
wartość 1PLN w przyszłości, w jej równowartość dziś, to taki proces
nazywa się dyskontowaniem. dyskontowanie to proces odwrotny do
kapitalizowania.  Innymi słowy, wartość aktualna ( bieżąca) wartości
przyszłej opisuje zależność:

.. math::

   P_V= frac{F_V}{(1+r)^n}

Inaczej mówiąc: wartość bieżąca (aktualna) (Present value) odpowiada
dzisiejszej (aktualnej) wartości przyszłych dochodów lub wpłat.

Stopa procentowa r jest nagrodą za użyczanie pieniadza i za ryzyko
zwiazane z przeniesieniem chwilowej własności tych pieniędzy i obawą
czy nowy własciciel będzie w stanie je zwrócić.

Powyższe rozważania a szczególnie wzory, pozwalają na sformułowanie
dwu ważnych praw charakteryzujących zachowania się pieniędzy w czasie.

 I. Pieniądz dzisiaj jest więcej wart niż pieniądz w przyszłości.

 II. Pieniądz ulokowany w ryzykownej inwestycji jest mniej wart niż
     pieniądz ulokowany w bezpiecznej inwestycji (mniejsze r).


Stopa nominalna i efektywna
---------------------------

Nominalna stopa procentowa oznacza stopę procentową obliczoną przy
zastosowaniu procentu prostego. Natomiast efektywna stopa procentowa
określa rzeczywiste oprocentowanie kapitału wynikające z zastosowania
nominalnej stopy procentowej oraz sposobu kapitalizowania odsetek.

Jeżeli odsetki są kapitalizowane raz do roku, to efektywna roczna
stopa procentowa będzie równa nominalnej rocznej stopie
procentowej. Natomiast jeśli odsetki będą kapitalizowane częściej niż
raz do roku, to efektywna roczna stopa procentowa będzie wyższa niż
nominalna roczna stopa procentowa.

Stopa procentowa w jednym okresie bazowym określona jest wzorem:

.. math::

   r =r_ NR SP / n

gdzie:

 - :math:`r`- stopa procentowa za jeden okres bazowy,
 - :math:`r_{NRSP}` - nominalna roczna stopa procentowa,
 - :math:`n` - liczba okresów bazowych w roku.

Wzór na efektywną roczną stopę procentową ma postać:

.. math::

   r_ERSP={(1+r)^n}-1

Lub też

.. math::

   r_ERSP={(1+r NR SP / n)^n}-1

gdzie:

 - :math:`r_ ERSP - efektywna roczna stopa procentowa,
 - :math:`r_ NRSP - nominalna roczna stopa procentowa,
 - :math:`r - stopa procentowa za jeden okres bazowy,
 - :math:`n - liczba kapitalizacji w roku (liczba okresów bazowych w roku).

Innymi słowy; Jeśli jesli naliczanie odsetek ma miejsce m razy w roku
i na koniec roku n będzie mn płatności odsetek to

.. math:: 

   F_V=P_V(1+r/m)^{nm}

czyli przy jednokrotnym  naliczaniu odsetek w roku  wzrost kapitału w ciągu roku bedzie równy

.. math:: r_w=(1+r)

przy półrocznym naliczaniu;

.. math:: 

   r_{wf}=(1+r/2)^2

przy naliczaniu kwartalnym

.. math:: 

   r_w=(1+r/4)^4

przy naliczaniu miesięcznym

.. math:: 

   r_w=(1+r/12)^12

a przy naliczaniu dziennym

.. math::

   r_w=(1+r/365)^365

gdzie:

 - :math:`r_w` - zannualizowany współczynnik wzrostu kapitału.

Czyli  częstsze naliczanie odsetek jest korzystne dla właściciela depozytu.

W sytuacji gdy liczba okresów bazowych n dąży do nieskończoności mamy
do czynienia z kapitalizacją ciągłą. Wzór na efektywną roczną stopę
procentową przy zastosowaniu ciągłej kapitalizacji odsetek przyjmuje
postać:

.. math::

   r_{ERSPC}=(e^r_{NRSP})-1

gdzie:
 
 - :math:`r_{ERSPC}` - efektywna roczna stopa procentowa przy ciągłej kapitalizacji  odsetek,
 - :math:`r_{NRSP} - nominalna roczna stopa procentowa,
 - :math:`e` -podstawa logarytmu naturalnego.


.. admonition:: Poeksperymentuj z komputerem!


.. sagecellserver::

		var('x')
		@interact
		def _(years=slider(range(1,30),default=4),rate=slider(0,100,1,default=27),N=slider(range(1,30),default=1)):

				pkts = [(float(i)/N,100*(1+(rate/(N))/100.)^i) for i in range(years*N+1)]
				plt = line(pkts,color='green',marker='o')
				plt += plot(100*exp(x*rate/100.),(x,0,years),color='red')
				sd,sc = pkts[-1][1],100*exp(years*rate/100.)
				print sd,sc,round((sc-sd)/((sc+sd)*0.5)*100,2),"%"
				plt.show(figsize=(6,2))




Wartość bieżąca netto
---------------------


Kilka sposobów jak ocenić czy inwestycja  jest atrakcyjna dla inwestora. w tym celu  można  skorzystac z ponizszych zależności:
Jeśli nabywamy jakiś  instrument finansowy to instrument ten generuje przepływy finansowe. Przepływy to : wypływ na nabycie instrumentu oraz wpływy do inwestora w postaci albo odsetek , lub dywidendy albo ( i) końcowej wypłaty pieniężnej ( zwrot zaciągniętej pożyczki albo wpływ ze sprzedaży akcji).
Ponieważ przepływy są odległe od siebie w czasie ich dzisiejsza wartość musi obliczyć w sposób podobny do wcześniej już prezentowanego.

Zdyskontowane strumienie pieniężne.


Dyskontowanie przepływów to wyrażanie ich w pieniądzu z okresu bieżącego czyli wartości aktualnej.

.. math:: P_V =\sum\limits_{i=1}^n\ P_V(D_i)}


gdzie  PV(Di) to wartość zaktualizowana przepływu Di
W przypadku stałych wartości płatności w czasie  wzór ten przybierze postać:

.. math::  P_o=\sum\limits_{i=1}^n\frac{D}{(1+r)^i}

Wartość bieżąca netto

Wartość  te wyliczamy odejmując od przyszłych wpływów finansowych dzisiejsze koszty inwestycji np. nabycie instrumentu
:<math>NPV=\sum_{t=1}^n\frac{D_t}{(1+r)^t}-I_0

gdzie:
*<math>NPV - wartość bieżąca netto,
*<math>D_t - przepływy gotówkowe w okresie t,
*<math>r - stopa dyskonta,
*<math>I_0 - nakłady początkowe,
*<math>t - kolejne okresy (najczęściej lata) inwestycji
Generalnie wartość bieżąca netto to różnica zdyskontowanych wpływów i wypływów finansowych (przyjmowanych ze znakiem-) generowanych przez inwestycje.
Jeśli NPV jest <0 to inwestycja jest  niekorzystna.


IRR czyli wewnętrzna stopa zwrotu


Dla skrajnego przypadku  NPV =0 rozwiązujemy powstałe równanie ze względu na  r. Takie rozwiązanie wymaga bardziej zaawansowanych metod obliczeń już dla t>1. A ponieważ mamy do czynienia z wielomianem rzędu więc do rozwiązywania stosujemy metody przybliżone.


==Obliczanie  wartości pieniadza w czasie==

Poniżej  pokazane będa dwa przykłady obliczeń z tego zakresu. Nie wymagają  bardzo uzycia bardzo skomplikowanych metod obliczeń ale mają za zadanie  pokazać specyfikę tego rodzaju obliczeń i  przydatność w tym celu  komputera oraz  wymaganych na wielu  egzaminach  zawodowych umejetności posługiwania sie kalkulatorem finansowym, które to urządzenie ma wbudowane mozliwości liczenia  szeregów geometrycznych i jest niezwykle przydatne w finansach. Warto zapoznać sie z tym urzadzeniem i  umieć dokonywać na nim róznych obliczeń.

Przykład:
Jaka jest wartość aktualna  ( bieżąca) kwoty 1000 PLN którą  otrzymamy za 15 lat  jeśli  dzisiaj  oferują nam depozyt na  7% rocznie?






==Instrumenty finansowe?==



===depozyt na rynku pieniężnym===

Depozyty rynku pieniężnego to instrumenty stałego oprocentowania, które są zawierane na określony okres czasu i nie mogą być likwidowane przed terminem zapadalności.
Ponieważ są instrumentami rynku pieniężnego ich okres do zapadalności jest mniejszy od jednego roku. Powoduje to potrzebę  przeliczania rocznej stopy procentownia na okresy mniejsze od roku.
Sumę odsetek na koniec okresu depozytu wyliczyc można ze wzoru:
 .. math:: R=D d (n/360)
Gdzie:
*R=suma odsetek
*D=wartość depozytu
*d= oprocentowanie depozytu (annualizowane)
*n= ilość dni pomiędzy początkiem okresu depozytu a jego zapadalnością 
 Należy zwrócić uwagę ,ze przyjęto tutaj standard roku liczącego 360 dni.  Gdyby standard był inny ( a jest top częsty przypadek) należy uwzględniać inna wartość dni w roku.
Efektywna stopę zwrotu na depozycie  można wyliczyć ze wzoru na wartość pieniądza w czasie.



=== Instrumenty dyskontowe===
Są to typowe instrumenty rynku pieniężnego wyceniane na zasadzie dyskonta tzn. są handlowane  z dyskontem w stosunku do wartości nominalnej. Jak już to było wykazane, ich cena aktualna jest równa 

'''<math>P =FV/(1+Y x DTM/360)\,'''

gdzie:

P – cena rynkowa

FV – wartość nominalna
 
Y – rentowność

DTM – ilość dni do wykupu,


