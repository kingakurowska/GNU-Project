# Projekt: Automatyzacja procesu dokowania z wykorzystaniem Glide (Schrödinger Suite)

## Temat i cel projektu
Celem projektu jest zautomatyzowanie pełnego procesu przygotowania struktur białko–ligand do dokowania molekularnego przy użyciu narzędzi z pakietu Schrödinger (takich jak Protein Preparation Wizard, LigPrep, Generate Glide Grids i Glide). Projekt umożliwia standaryzację parametrów i usprawnienie pracy zespołowej, w której wiele osób korzysta z tego samego pipeline’u.
* Ujednolicenie procesu przygotowania układów do dokowania, niezależnie od użytkownika.
* Zapewnienie powtarzalności i spójności wyników dzięki stałym parametrom.
* Automatyczne zapisywanie informacji o każdym kroku w dzienniku laboratoryjnym (data, nazwa skryptu, pliki wejściowe i wyjściowe)

## Wymagania
* Pakiet Schrödinger (testowane na wersji 2025-1)
* Pliki wejściowe: struktura białka w formacie `.pdb` oraz struktury ligandów w formacie `.sdf`

## Repozytorium Zawiera:
* Folder zawierający 4 skrypty:
  * ProteinPrep_script.sh
  * LigPrep_script.sh
  * GenerateGrid_script.sh
  * GlideDocking_script.sh
* Folder zawierający przykładowe dane wejściowe:
  * struktura receptora D2 w formacie `.pdb`
  * struktury ligandów receptora D2 z bazy CHEMBL w formacie `.sdf`

## Instrukcja
Każdy skrypt wykonuje pojedynczy etap przygotowania. Skrypty należy wywoływać w podanej kolejności, przekazując wymagane argumenty. Wszystkie operacje są automatycznie logowane w dzienniku laboratoryjnym.

### 1. Przygotowanie białka (Protein PReparation)
Przygotowuje strukturę białka, ustalając protonację, uzupełniając brakujące fragmenty i poprawiając geometrię.
```
{bash}
./ProteinPrep_script.sh bialko.pdb
```
Tworzy plik z przygotowanym do dalszej pracy białkiem w formacie `.mae`

### 2. Przygotowanie ligandów (Ligand Preparation)
Przygotowuje ligandy, generując ich odpowiednie formy protonacyjne i konformacje (w tym stereoizomery).
```
{bash}
./LigPrep_script.sh ligandy.sdf
```
Tworzy plik z przygotowanymi do dalszej pracy ligandami w formacie `.mae`

### 3. Generowanie siatki dokowania (Receptor Grid)
Tworzy siatkę przestrzenną wokół miejsca wiązania białka, która służy do dokowania ligandów.
```
{bash}
./GenerateGrid_script.sh bialko.mae
```
Tworzy plik `.zip` zawierający receptor z miejscem dokowania ligandów

### 4. Dokowanie ligandów
Przeprowadza symulację dopasowania ligandów do siatki receptora, generując możliwe pozy i oceny dopasowania wiązania.
```
{bash}
./GlideDocking_script.sh bialko_grid.zip ligandy.mae
```
Tworzy pliki `.maegz` z pozami dokowania
