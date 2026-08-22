# Einkaufsliste — Funktionstest

**Stand:** 2026-08-22
**Zweck:** Alles für Schritt 1 bis 4 der Vorgehensreihenfolge
(`grundlagen.md` §8.4) — Pack außerhalb des Fahrzeugs aufbauen, anschließen und
am aufgebockten Roller erproben.

> [!CAUTION]
> **Sicherung, Trennschalter und Multimeter sind kein Zubehör.** Ein 16S-Pack
> liefert Kurzschlussströme im Kiloampere-Bereich; ein vergessener Schraubschlüssel
> auf zwei Polen verdampft Metall. Wer ohne diese drei Positionen anfängt, baut
> ohne Bremse.

---

## Bemerkenswert vorab

**Der Testkauf ist fast der gesamte Materialbedarf.** Es fehlen anschließend nur
noch Aluminium-Endplatten (~115 €) und Filament (~110 €). Der Grund: Die Zellen
dominieren die Rechnung, und sie werden vollständig gebraucht — ein reduzierter
Testkauf ist nicht sinnvoll, weil alle sechzehn Zellen aus derselben Charge
stammen müssen (`grundlagen.md` §8.4).

---

## A · Zwingend

| Pos | Artikel | Menge | Preis | Anmerkung |
|---|---|---:|---:|---|
| A1 | **EVE LF105**, 105 Ah, 3,2 V, Grade A | 16 | **640 €** | **eine Bestellung, eine Charge.** 39,98 € brutto je Stück — die 33,60 € im Shop sind der PV-Nullsteuersatz und gelten hier nicht |
| A2 | **BMS JK PB2A16S20P**, 16S, 200 A, 2 A aktiver Balancer | 1 | **109 €** | Softwareversion **≥ 6.0** verlangen. Ein RS485-Port bleibt für Rafflers Modul frei |
| A3 | **Busbars M6**, passend zu 67 mm Polabstand | 18 | 60–100 € | 15 werden gebraucht, Reserve wegen Verschaltungsfehlern. **Liegen den Zellen nicht bei** |
| A4 | **Hauptsicherung** ANL/Mega **200 A träge** mit Halter | 1 | 25–35 € | direkt an den Pluspol des Packs |
| A5 | **Batterie-Trennschalter** ≥ 250 A | 1 | 25–45 € | erlaubt spannungsfreies Arbeiten zwischen den Versuchen |
| A6 | **Leistungskabel** 35 mm², schwarz und rot | je 2,5 m | 45–70 € | vom Pack zu den Portleitungen im Schacht |
| A7 | **Kabelschuhe** M6 und M8 für 35 mm² | 10 | 12–20 € | fertig gecrimpte Kabel sind eine Alternative zur Crimpzange |
| A8 | **Multimeter** mit 60-V-DC-Bereich | 1 | 25–60 € | Zellprüfung, Verschaltungskontrolle vor dem ersten Einschalten |
| A9 | **Drehmomentschlüssel** 2–10 Nm | 1 | 30–60 € | **Pole mit 4–6 Nm.** Gewinde sitzen im Aluminium des Zelldeckels |
| | **Summe A** | | **971–1.149 €** | |

## B · Provisorische Verspannung

Die Zellen müssen auch beim Test verspannt sein — 3 bis 5 kN je Stapel, sonst
quellen sie auf und nehmen Schaden (`grundlagen.md` §3.3).

| Pos | Artikel | Menge | Preis | Anmerkung |
|---|---|---:|---:|---|
| B1 | Multiplex oder Siebdruckplatte, 18–21 mm | 2 Stück ~300 × 220 mm | 15–25 € | Endplatten des Testaufbaus |
| B2 | Gewindestangen M8, verzinkt | 4 × 500 mm | 10–15 € | für den Test genügt Baumarktqualität |
| B3 | Muttern M8 selbstsichernd, Karosseriescheiben | je 16 | 10–15 € | |
| | **Summe B** | | **35–55 €** | |

## C · Laden

| Pos | Artikel | Menge | Preis | Anmerkung |
|---|---|---:|---:|---|
| C1 | **Ladegerät 58,4 V CC/CV**, 15–20 A | 1 | 150–250 € | **Nicht das Seriengerät** — dessen 59 V liegen über dem LFP-Ladeschluss, und 6 A bedeuteten 15 h |
| | **Summe C** | | **150–250 €** | Preise streuen stark, hier lohnt ein Vergleich |

## D · Kleinmaterial

| Pos | Artikel | Preis | Anmerkung |
|---|---|---:|---|
| D1 | Schrumpfschlauch, Isolierband, Kabelbinder | 15–25 € | |
| D2 | Isoliermatte oder Gummimatte als Unterlage | 10–20 € | Pack steht auf dem Werkstattboden |
| D3 | Aderendhülsen und Kabel für die Balancerleitungen | 10–15 € | meist liegt ein Satz beim BMS |
| | **Summe D** | **35–60 €** | |

---

## Gesamt

| Block | von | bis |
|---|---:|---:|
| A Zwingend | 971 € | 1.149 € |
| B Verspannung | 35 € | 55 € |
| C Laden | 150 € | 250 € |
| D Kleinmaterial | 35 € | 60 € |
| **Summe** | **1.191 €** | **1.514 €** |

Davon sind **749 €** durch konkrete Angebote belegt (Zellen und BMS), der Rest
ist geschätzt. Wer Multimeter und Drehmomentschlüssel bereits besitzt, spart
55–120 €.

**Später folgen** nur noch Aluminium-Endplatten (~115 €) und Filament (~110 €),
zusammen rund 225 €.

---

## Was bewusst nicht auf der Liste steht

| Posten | warum später |
|---|---|
| Aluminium-Endplatten | erst für das endgültige Gehäuse; beim Test tun es Holzplatten |
| Filament | die Kontur steht erst nach dem Ausmessen des Schachts fest |
| Schaumlagen zwischen den Zellen | dienen der Alterung über Jahre, für einen Test entbehrlich |
| Vorladewiderstand | nötig vor der ersten Fahrt, nicht für den Aufbau |
| Crimpzange 35 mm² | vermeidbar durch fertig konfektionierte Kabel |

---

## Reihenfolge beim Aufbau

1. **Alle 16 Zellen einzeln auf Ruhespannung messen** und notieren. Abweichungen
   über 50 mV zwischen den Zellen vor dem Verschalten klären.
2. Zellen zwischen die Platten setzen, Zugstangen **über Kreuz** anziehen.
3. Verschalten — **Reihenfolge und Polarität zweimal prüfen**, bevor der letzte
   Busbar gesetzt wird. Ein falsch gesetzter Verbinder bedeutet Kurzschluss über
   zwei Zellen.
4. Balancerleitungen anschließen, dabei **von Zelle 1 aufsteigend**. Am BMS
   erst anstecken, wenn alle Abgriffe sitzen und die Spannungsfolge stimmt.
5. Gesamtspannung messen: bei halb geladenen Zellen **rund 52 V** erwartbar.
6. Erst dann Sicherung einsetzen und Trennschalter schließen.
