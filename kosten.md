# Kostenabschätzung

**Stand:** 2026-08-21 · **Ersetzt** die NMC-Fassung vom 2026-08-20 vollständig.
**Grundlage:** `konstruktion.md` — 16S1P LFP, EVE LF105, 5,38 kWh.
**Alle Preise brutto**, einschließlich 19 % Umsatzsteuer, als Endkundenpreise
für Privatbezug. Die Spalte „wahrscheinlich" ist der Wert bei vernünftigem
Einkauf — nicht die billigste Quelle, nicht die teuerste.

---

## Was sich gegenüber der ersten Fassung geändert hat

Die erste Abschätzung rechnete mit **14S NMC** und nannte drei Beschaffungswege,
weil prismatische NMC-Zellen in Europa kaum zu bekommen sind. Diese Unsicherheit
ist entfallen:

| | erste Fassung | jetzt |
|---|---|---|
| Chemie | 14S NMC | **16S LFP** |
| Zellbeschaffung | drei Szenarien, 260–1.800 € | **ein Händler, fester Preis** |
| Spanne gesamt | 900–2.950 € | **1.300–1.820 €** |
| Größter Unsicherheitsfaktor | die Zellen | jetzt Ladegerät und Aluzuschnitt |

Zugleich sind zwei Posten hinzugekommen, die es im NMC-Entwurf nicht gab:
**Aluminium-Endplatten und Zugstangen**. Sie ergeben sich aus der
Verspannungsanforderung des Zelldatenblatts (3–5 kN je Stapel), die erst bei der
Auswertung zutage trat.

---

## Belegte Posten

| Posten | Preis | Quelle |
|---|---|---|
| **16 × EVE LF105**, Grade A, 105 Ah | **640 €** | LiFePO Shop GmbH, 39,98 €/Stück |
| **BMS** JK PB2A16S20P, 16S, 200 A, 2 A aktiver Balancer, BT + CAN | **109 €** | powercells.de, inkl. Versand |
| | **749 €** | |

> Der Shop weist die Zelle mit 33,60 € aus — das ist der Nullsteuersatz nach
> § 12 Abs. 3 UStG für Photovoltaikspeicher in Wohngebäuden, der für einen
> Fahrzeugakku nicht gilt. Gerechnet wird durchgehend mit dem Bruttopreis.

Zum BMS: 16S-LFP-BMS sind Massenware aus dem Solarspeicherbau — große Auswahl,
niedriger Preis, gute Dokumentation. Die Wahl fiel nicht nur wegen des Preises
auf das JK-Modell: Raffler verlangt ein Gerät, dessen Kommunikation vollständig
reverse-engineered ist und das Befehle für die Ausgangs-MOSFETs entgegennimmt,
damit sein Modul später echte Daten ans Display liefern kann. Das JK-BMS erfüllt
beides (`grundlagen.md` §3.2).

---

## Geschätzte Posten

### Skelett und Mechanik

| Posten | von | bis | wahrsch. | Anmerkung |
|---|---:|---:|---:|---|
| Aluplatten 2 × 260 × 400 × 8 mm | 80 € | 150 € | **115 €** | ~4,5 kg AlMg3, Zuschnitt inbegriffen |
| Bohrungen für die Zugstangen | 0 € | 60 € | **0 €** | 16 Löcher; in 8 mm Alu selbst machbar |
| Zugstangen M8 A2-70, Muttern, Scheiben | 30 € | 50 € | **40 €** | 2 m Gewindestange, 16 Sicherungsmuttern |
| Busbars M6, 15 Stück | 50 € | 100 € | **75 €** | **nicht im Zelllieferumfang** |
| Schaumlagen | 20 € | 35 € | **28 €** | EPDM 3 mm, ~0,4 m² |
| **Summe** | **180 €** | **395 €** | **258 €** | |

Zu den Busbars: Die Standardschienen aus dem Solarspeicherbau sind meist für
rund 100 A ausgelegt. Bei 180 A Spitzenstrom braucht es kräftigere oder
verzinnte Kupferschienen — daher der höhere Ansatz.

### Gehäuse

| Posten | von | bis | wahrsch. | Anmerkung |
|---|---:|---:|---:|---|
| ASA, 3,5 kg | 75 € | 125 € | **100 €** | Vollteil, zwei Segmente |
| PETG, 0,3 kg | 8 € | 12 € | **10 €** | Testring T-01 |
| **Summe** | **83 €** | **137 €** | **110 €** | |

### Elektrik

| Posten | von | bis | wahrsch. | Anmerkung |
|---|---:|---:|---:|---|
| Ladegerät 58,4 V CC/CV, 15–20 A | 150 € | 250 € | **190 €** | Serienteil ungeeignet: 59 V, nur 6 A |
| Leistungskabel 35 mm², Kabelschuhe | 50 € | 90 € | **70 €** | die Portleitungen selbst sind vorhanden |
| Trennschalter und Vorladewiderstand | 40 € | 100 € | **65 €** | gegen Einschaltlichtbogen |
| Hauptsicherung 200 A ANL mit Halter | 20 € | 35 € | **28 €** | träge |
| Isolation, Schrumpfschlauch, Kleinteile | 30 € | 60 € | **45 €** | |
| **Summe** | **290 €** | **535 €** | **398 €** | |

---

## Gesamt

| Block | von | bis | wahrscheinlich |
|---|---:|---:|---:|
| Zellen und BMS *(belegt)* | 749 € | 749 € | **749 €** |
| Skelett und Mechanik | 180 € | 395 € | **258 €** |
| Gehäuse | 83 € | 137 € | **110 €** |
| Elektrik | 290 € | 535 € | **398 €** |
| **Summe brutto** | **1.302 €** | **1.816 €** | **1.515 €** |

**Rechne mit rund 1.500 €** für das fertige Paket. Die Untergrenze setzt
konsequent günstigen Einkauf voraus, die Obergrenze Markenware und
Fremdbohrungen.

**Die Zellen machen nur noch 42 % der Kosten aus.** In der NMC-Fassung
dominierten sie die Rechnung; jetzt dominiert das Drumherum. Weiteres Sparen
lohnt daher nicht am Zellsatz, sondern beim Ladegerät — dort streuen die Preise
am stärksten.

---

## Nicht enthalten

| Posten | Grobwert | Anmerkung |
|---|---|---|
| Prüforganisation, Abnahme | 200–600 € | Umfang ungeklärt, `grundlagen.md` §9 |
| Werkzeug: Crimpzange, Drehmomentschlüssel, Zelltester | 100–300 € | einmalig, teils leihbar |
| Fehldruck des Vollteils | 20–80 € | genau dagegen dient der Testring |
| Raffis CAN-Modul | 0 € | vorhanden |

**Projektaufwand insgesamt**, wenn Werkzeug und Abnahme dazukommen und nichts
geliehen wird: **1.800 bis 2.400 €**. Wer Crimpzange und Drehmomentschlüssel im
Haus hat und bei der Abnahme glimpflich davonkommt, liegt näher an 1.700 €.

---

## Einordnung

Die Originalakkus sind weiterhin erhältlich, kosten aber **1.400 € pro Stück**
(Stand 2026-08-21, Angabe Christoph). Für drei Stück also **4.200 €**.

| | Original, 3 Packs | Zellblock 16 |
|---|---:|---:|
| Preis | **4.200 €** | **~1.515 €** |
| Energie | 4,33 kWh | **5,38 kWh** (+24 %) |
| **Preis je kWh** | **970 €** | **282 €** |
| Zyklen | ~1.000 | **> 6.000** |
| Garantie | Herstellerlage unklar | 3 Jahre auf die Zellen |
| Ersatz einer defekten Zelle | ganzer Pack, 1.400 € | eine Zelle, **40 €** |

**Die Ersparnis beträgt rund 2.700 €, also 64 %.** Selbst wenn Werkzeug und
behördliche Abnahme voll hinzugerechnet werden, bleiben es über 1.800 € oder
43 %.

Am deutlichsten wird es an einem einzelnen Pack: **Ein Originalakku kostet
1.400 € und liefert 1,44 kWh. Der komplette Eigenbau kostet 1.515 € und liefert
5,38 kWh** — das 3,7-fache an Energie für 8 % mehr Geld.

Der Preis ist damit das stärkste Argument. Die längere Lebensdauer und die
Reparierbarkeit kommen hinzu: Fällt später eine Zelle aus, kostet der Ersatz 40 €
statt eines kompletten Packs, und die Zelle ist Massenware aus dem
Solarspeicherbau statt eines Ersatzteils, das an einem einzigen Anbieter hängt.

---

## Verbliebene Unsicherheit

Drei Posten tragen den Großteil der 514 € Spannbreite:

| Posten | Spanne | wodurch bestimmt |
|---|---:|---|
| Aluplatten mit Bohrungen | 130 € | ob selbst gebohrt wird |
| Ladegerät | 100 € | Markenware gegen Importgerät |
| Busbars | 50 € | Querschnitt für 180 A |

Alles Übrige ist belegt oder Kleinmaterial ohne Hebelwirkung. Vor der Bestellung
lohnt daher genau ein Preisvergleich: das Ladegerät.
