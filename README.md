### Kodowanie informacji w obrazkach

Rozwiązanie zawiera dwie metody szyfrowania kodu w obrazkach: szyfrowanie na podstawie porównania dwóch obrazków oraz metodą średnich wartości w kanałach piksela.

#### Autorzy:
Paweł Kmiecik
Maciej Trznadel
Anna Chomicz
Ignacy Wilczyński

#### Porównanie dwóch obrazków
W pikselach jednego obrazka zapisywany jest kod. Odczyt odbywa się na podstawie porównania wartości dwóch pikseli obrazków. Różnice liczbowe odpowiadają kodom znaków ASCII.

Aby użyć programu należy z folderu ze skryptami uruchomić należy komendę np.
`CodeImageProsty('zuraw.jpg','haslo')`

Zostanie utworzony plik `wyjscie.bmp` z zaszyfrowanym hasłem.

Aby odczytać z niego hasło należy uruchomić komendę:
`DecodeImageProsty('zuraw.jpg', 'wyjscie.bmp')`

Wypisane zostanie hasło `haslo`.

#### Metoda średnich wartości pikseli
Prawie działa...
