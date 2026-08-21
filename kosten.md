# Kostenabschätzung

**Stand:** 2026-08-21 · **Ersetzt** die NMC-Fassung vom 2026-08-20 vollständig.
**Grundlage:** `konstruktion.md` — 16S1P LFP, EVE LF105, 5,38 kWh.

---

## Was sich gegenüber der ersten Fassung geändert hat

Die erste Abschätzung rechnete mit **14S NMC** und nannte drei Beschaffungswege,
weil prismatische NMC-Zellen in Europa kaum zu bekommen sind. Diese Unsicherheit
ist entfallen:

| | erste Fassung | jetzt |
|---|---|---|
| Chemie | 14S NMC | **16S LFP** |
| Zellbeschaffung | drei Szenarien, 260–1.800 € | **ein Händler, fester Preis** |
| Spanne gesamt | 900–2.950 € | **1.250–1.670 €** |
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

> **Achtung Nullsteuersatz.** Der Shop weist die Zelle mit **33,60 €** aus,
> ausdrücklich „mit 0 % MwSt." Das ist der Nullsteuersatz nach § 12 Abs. 3 UStG
> für Photovoltaikspeicher in oder an Wohngebäuden. **Für einen Fahrzeugakku gilt
> er nicht.** Zu kalkulieren ist der Bruttopreis von 39,98 €, also 640 € statt
> 538 € für den Satz.

Zum BMS: 16S-LFP-BMS sind Massenware aus dem Solarspeicherbau — große Auswahl,
niedriger Preis, gute Dokumentation. Der CAN-Anschluss ist ein Nebengewinn:
Raffler plant, sein Modul künftig an echte BMS-Daten anzubinden
(`grundlagen.md` §3.2).

---

## Geschätzte Posten

### Skelett und Mechanik

| Posten | Spanne | Anmerkung |
|---|---|---|
| Aluplatten 2 × 260 × 400 × 8 mm | 60–120 € | Zuschnittservice, ~4,5 kg AlMg3 |
| Zugstangen M8 A2-70, 8 Stück, Muttern, Scheiben | 30–50 € | |
| Busbars M6, 15 Stück | 30–60 € | **nicht im Zelllieferumfang** |
| Schaumlagen zwischen den Zellen | 15–25 € | EPDM 2–3 mm, für die Alterungsausdehnung |
| **Summe** | **135–255 €** | |

### Gehäuse

| Posten | Spanne | Anmerkung |
|---|---|---|
| ASA, 3–3,5 kg | 75–125 € | Vollteil, zwei Segmente |
| PETG, ~0,3 kg | 8–12 € | Testring T-01, PETG genügt |
| **Summe** | **83–137 €** | |

### Elektrik

| Posten | Spanne | Anmerkung |
|---|---|---|
| Ladegerät 58,4 V CC/CV, 15–20 A | 150–250 € | Serienteil ungeeignet: 59 V, nur 6 A |
| Leistungskabel, Kabelschuhe | 40–80 € | **die Portleitungen sind vorhanden** |
| Trennschalter und Vorladewiderstand | 40–100 € | gegen Einschaltlichtbogen |
| Hauptsicherung 200 A ANL, träge, mit Halter | 20–35 € | |
| Isolation, Schrumpfschlauch, Kleinteile | 30–60 € | |
| **Summe** | **280–525 €** | |

---

## Gesamt

| Block | von | bis |
|---|---|---|
| Zellen und BMS *(belegt)* | 749 € | 749 € |
| Skelett und Mechanik | 135 € | 255 € |
| Gehäuse | 83 € | 137 € |
| Elektrik | 280 € | 525 € |
| **Summe** | **1.247 €** | **1.666 €** |

**Die Zellen machen nur noch 38–51 % der Kosten aus.** In der NMC-Fassung
dominierten sie die Rechnung; jetzt dominiert das Drumherum. Weiteres Sparen
lohnt daher nicht am Zellsatz, sondern beim Ladegerät und beim Aluzuschnitt.

---

## Nicht enthalten

| Posten | Grobwert | Anmerkung |
|---|---|---|
| Prüforganisation, Abnahme | 200–600 € | Umfang ungeklärt |
| Werkzeug: Crimpzange, Drehmomentschlüssel | 100–300 € | einmalig, teils leihbar |
| Fehldruck | 20–80 € | genau dagegen dient der Testring |
| Raffis CAN-Modul | 0 € | vorhanden |

---

## Einordnung

Drei neue Kraftpakete 2.0 lagen bei etwa **2.100 €** und sind seit der Insolvenz
nicht mehr regulär erhältlich.

| | Original, 3 Packs | Zellblock 16 |
|---|---|---|
| Preis | ~2.100 € | **1.250–1.670 €** |
| Energie | 4,33 kWh | **5,38 kWh** (+24 %) |
| Zyklen | ~1.000 | **> 6.000** |
| Garantie | entfallen | 3 Jahre auf die Zellen |
| Ersatzteilversorgung | keine | Einzelzellen nachkaufbar |

Der eigentliche Gewinn ist nicht der Preis, sondern die Unabhängigkeit von einem
Ersatzteilmarkt, den es nicht mehr gibt. Eine einzelne ausgefallene Zelle kostet
künftig 40 € statt eines kompletten Packs.

---

## Verbliebene Unsicherheit

Zwei Posten sind noch nicht angefragt und tragen die Hälfte der Spanne:

1. **Ladegerät** (150–250 €) — hier lohnt ein Vergleich, die Preise streuen stark.
2. **Aluzuschnitt** (60–120 €) — abhängig davon, ob die Bohrungen mitbestellt
   oder selbst gesetzt werden.

Alles andere ist entweder belegt oder Kleinmaterial mit geringer Hebelwirkung.
