# Grundlagen: Ersatzakku Kumpan 54 ignite

**Stand:** 2026-08-20
**Status:** Verbindliche Arbeitsgrundlage. Ersetzt `spezifikation.md` (veraltet, siehe dort).
**Projektziel:** Ersatz der drei Kraftpaket-2.0-Wechselakkus durch einen fest
verbauten Eigenbau-Pack mit teilweise 3D-gedrucktem Gehäuse.

> **Sicherheitshinweis.** Es wird mit bis zu 59 V DC und Kurzschlussströmen im
> Bereich mehrerer hundert Ampere gearbeitet. Isoliertes Werkzeug verwenden,
> während der Montage stets einen Pol getrennt halten, Zellen gegen Verrutschen
> und gegen Kurzschluss zum Rahmen isolieren. Der Umbau berührt Betriebserlaubnis
> und Versicherungsschutz (Abschnitt 8).

---

## 0. Belegstatus — Legende

Jede Zahl in diesem Dokument trägt eine Herkunftsmarke. Ohne Marke gilt eine
Aussage als unbelegt und darf nicht als Planungsgrundlage dienen.

| Marke | Bedeutung |
|---|---|
| **[HB s]** | Benutzerhandbuch `Materials/Benutzerhandbuch_ignite_54i.pdf`, Dokumentseite s. Herstellerangabe, höchste Belegqualität. |
| **[MESS]** | Von Christoph am Fahrzeug bzw. Akku gemessen. |
| **[BER]** | Aus [HB]- oder [MESS]-Werten berechnet. Rechenweg jeweils angegeben. |
| **[REC]** | Web-Recherche. Marktüblich, aber **nicht produktverbindlich** — vor Bestellung am Datenblatt prüfen. |
| **[ANN]** | Begründete Annahme. Ersetzen, sobald belegbar. |
| **[OFFEN]** | Ungeklärt. Blockiert die jeweils genannte Folgeentscheidung. |

---

## 1. Fahrzeug

| Parameter | Wert | Beleg |
|---|---|---|
| Modell | Kumpan 54 ignite | [HB] |
| Höchstgeschwindigkeit | 100 km/h | [HB 6] |
| Motor | Bürstenloser DC-Radnabenmotor | [HB 68] |
| Maximale Leistung | **7.000 W** | [HB 68] |
| Maximales Drehmoment | 141 Nm | [HB 68] |
| Bordnetz-Spannungswandler | 12 V / 48 V | [HB 69] |
| Leergewicht | **93 kg**, ohne Akkus | [HB 70], [BER] |
| Zulässige Gesamtmasse | **280 kg** | [HB 70] |
| Serienausstattung | 2 Kraftpakete (Christoph hat 3) | [HB 29] |
| Bremsen | Hydraulische Scheibenbremsen, CBS/ABS | [HB 70] |

**Zum Leergewicht.** Das Handbuch nennt 82 kg für iconic und impulse, 93 kg für
ignite, und führt das Akkugewicht mit „9,9 kg pro Akku" **separat** auf. Da
iconic serienmäßig einen und impulse zwei Akkus hat, beide aber mit 82 kg
angegeben sind, können die Akkus nicht enthalten sein. [BER]

> **[OFFEN] — Zulassungsbescheinigung Teil I prüfen.** Verbindlich ist Feld **G**
> (Leermasse) und Feld **F.1** (zulässige Gesamtmasse) in Christophs Papieren,
> nicht das Handbuch. Bei Elektrofahrzeugen wird die Antriebsbatterie in Feld G
> häufig eingerechnet — dann verschiebt sich die Zuladungsrechnung in
> Abschnitt 5. Blockiert: nichts Kritisches, die Reserve ist groß.

---

## 2. Original-Akku „Kraftpaket 2.0"

| Parameter | Wert | Beleg |
|---|---|---|
| Typ | Li-Ionen-Corepack aus Einzelzellen | [HB 27] |
| Nennspannung | **50,6 V** | [HB 27] |
| Kapazität | **28,5 Ah / 1.442 Wh** | [HB 27] |
| Gewicht | **9,9 kg** | [HB 70] |
| Anzahl Steckplätze | 3 | [HB 25] |
| Zulässige Bestückung | 1 bis 3 Stück | [HB 69] |
| Reichweite je Akku (ECE 134/2014) | 36,5 km | [HB 69] |
| Reichweite gesamt, 3 Akkus, real | ~80 km | [HB 69] |

**Beschaffungslage:** Originalpacks sind weiterhin erhältlich, zu **1.400 € pro
Stück** (Stand 2026-08-21). Ein Ersatz aller drei kostet damit 4.200 €. Die
frühere Annahme von ~700 € stammte aus einem Forenbeitrag und ist überholt.

Die Technische-Daten-Seite [HB 69] nennt gerundet „51 V / 29 Ah / 1.470 Wh".
Maßgeblich ist die präzisere Angabe der Akkuseite [HB 27].

**Paritätsziel für den Ersatzpack:** 3 × 1.442 Wh = **4.326 Wh**. [BER]

**Realverbrauch:** 4.326 Wh ÷ 80 km = **54 Wh/km**. [BER]
Nach Prüfnorm: 1.442 Wh ÷ 36,5 km = 39,5 Wh/km. [BER]

---

## 3. Zellkonfiguration

### 3.0 Das Original ist 14S NMC — belegt

Die Konfiguration ist über das Ladegerät eindeutig bestimmt:

| Parameter | Wert | Beleg |
|---|---|---|
| Ladegerät-Typ | PBI48-8, IC-gesteuert, CC-Kennung | [HB 69] |
| Ladegerät-Ausgang | **59 V, 6 A** | [HB 69] |
| Ladezeit je Akku | 4,5 h | [HB 68] |

**Herleitung:** 59 V ÷ 14 = **4,214 V/Zelle** — exakt der Ladeschluss von NMC.
Gegenprobe Nennspannung: 50,6 V ÷ 14 = 3,614 V/Zelle, ebenfalls NMC-typisch. [BER]

**Ausgeschlossene Alternativen** [BER]:
- 13S: 59 ÷ 13 = 4,54 V/Zelle — physikalisch unmöglich.
- 15S: 59 ÷ 15 = 3,93 V/Zelle — kein gängiger Ladeschluss.
- 16S LFP: Für das *Original* ausgeschlossen — 59 V ergäben 3,69 V/Zelle, über
  dem LFP-Ladeschluss. Für den *Ersatzpack* ist es die getroffene Wahl, weil
  dessen Ladegerät ohnehin ersetzt und auf 58,4 V eingestellt wird. Siehe §3.1.

Dieser Befund gilt dem **Originalakku**. Er sagt, welches Spannungsfenster der
Controller ab Werk erwartet — nicht, womit der Ersatzpack gebaut werden muss.
Die Entscheidung darüber steht in §3.1.

### 3.1 Der Ersatzpack wird 16S LFP — Entscheidung

**Gesetzt am 2026-08-21.** Nicht 14S NMC wie das Original, sondern **16 Zellen
LiFePO4 in Reihe**, konkret die EVE LF105.

| Parameter | Wert |
|---|---|
| Konfiguration | **16S1P**, LiFePO4 |
| Zelle | EVE LF105, 105 Ah, 3,2 V |
| Nennspannung | **51,2 V** (16 × 3,2 V) |
| Ladeschluss | **58,4 V** (16 × 3,65 V) |
| Entladeschluss BMS | 44,8 V (16 × 2,8 V) |
| Energie | **5,38 kWh** (+24 % gegenüber Parität) |

**Die Spannungsfenster sind nahezu deckungsgleich** [BER]:

| | 14S NMC (Original) | 16S LFP (Ersatz) |
|---|---|---|
| leer | 42,0 V | 40,0 V |
| nominal | 50,6 V | 51,2 V |
| voll | 58,8 V | 58,4 V |

Beide liegen unter der Obergrenze des Motorcontrollers von 60 V (§3.2).

### Wie die Entscheidung zustande kam

Zunächst war NMC gesetzt, gestützt auf drei Argumente. **Alle drei sind
gefallen:**

| Argument gegen LFP | Warum es nicht mehr trägt |
|---|---|
| „Das Ladegerät liefert 59 V, zu viel für LFP" | Das Serien-Ladegerät wird ohnehin ersetzt — mit 6 A bräuchte es 15 h. Ein neues wird auf 58,4 V eingestellt. |
| „Die flache Entladekurve macht die Ladestandsanzeige unbrauchbar" | Rafflers Modul **interagiert nicht mit dem Akku** und leitet keinen Ladestand ab (§3.2). Es gibt nichts, was falsch anzeigen könnte. |
| „1C Dauerstrom ist zu knapp" | Bei Christophs Fahrprofil bis ~70 km/h liegen 45–65 A an, also 0,4–0,6C. Erst Dauerfahrt bei 100 km/h träfe die Grenze. |

Hinzu kamen zwei Argumente **für** LFP, die vorher nicht bekannt waren:

- **Beschaffbarkeit.** Prismatische NMC-Zellen sind im europäischen Handel
  praktisch nicht erhältlich; der Markt ist LFP-dominiert, weil er vom
  Solarspeicherbau getragen wird. LFP gibt es mit Datenblatt, Gewährleistung und
  in Tagen. Siehe `kosten.md`.
- **Zyklen und Preis.** > 6.000 statt ~800 Zyklen, und 640 € statt 865–1.370 €
  für den Zellsatz.

Dazu kommt die deutlich gutmütigere Thermik — relevant bei einem fest verbauten
Pack, der in der Garage steht.

### Was 16S statt 14S kostet

**Zwei Zellen mehr im Strang.** Raffler hält das für unproblematisch (§3.2), und
das Spannungsfenster bestätigt es. Für die Beschaffung ist es sogar ein Vorteil:
16S-LFP-BMS sind Massenware aus dem Solarspeicherbau.

**Bauform.** Das im LFP-Markt normierte Höhenmaß von ~200 mm passt nicht
beliebig in die 430 mm Bauhöhe. Zwei Etagen à 200,5 mm ergeben 401 mm und lassen
29 mm für Boden, Zwischenplatte und Deckel — das geht auf, aber nur mit dem
Kunstgriff, die überstehenden Pole in der Zwischenplatte zu versenken.
Siehe `konstruktion.md` §8.1.

### 3.2 Auskunft Raffler (CAN-Modul), 2026-08-20

Per Telegram eingeholt. **Belegqualität: Herstelleraussage des Modulentwicklers**,
im Wortlaut vorliegend.

| Frage | Antwort |
|---|---|
| Interagiert das Modul mit dem Akku? | **Nein.** „aktuell kann das Modul einfach vortäuschen, dass ein akku drin ist. mit einem akku selber würde es aber nicht interagieren." |
| Ist 16S LFP nutzbar? | **Ja**, „99 % sicher … problemlos" |
| Spannungsgrenze? | **„der Motorcontroller ist mit max. 60 V der Flaschenhals"** |
| Toleranz nach unten? | „ich bin den roller probeweise auch mit 36 v gefahren. also selbst stärkere abweichungen waren ok" |
| Rekuperation | „ich denke ich bin kurz davor das zu schaffen" — in Arbeit |
| BMS-Anbindung für echte Daten | geplant, aber „nicht in absehbarer zukunft verfügbar" |

**Drei Konsequenzen:**

1. **Die SoC-Frage ist gegenstandslos.** Das Modul leitet keinen Ladestand aus
   der Spannung ab — es sendet erfundene Daten. Das frühere Argument gegen LFP
   („flache Entladekurve macht die Anzeige unbrauchbar") setzte voraus, dass
   überhaupt etwas interpretiert wird. Tut es nicht.
2. **Nach dem Umbau gibt es keine echte Ladestandsanzeige im Roller.** Der SoC
   kommt aus der Bluetooth-App des eigenen BMS. Das gilt chemieunabhängig und ist
   eine bewusst hinzunehmende Folge des Ausstiegs aus dem OEM-Ökosystem.
3. **Neue harte Obergrenze: 60 V am Motorcontroller.** 16S LFP (58,4 V) und
   14S NMC (58,8 V) liegen beide darunter. Das Original-Ladegerät mit 59 V ließe
   nur 1 V Reserve — ein weiterer Grund, es zu ersetzen.

### Anforderung an die BMS-Wahl (Raffler, 2026-08-21)

> „wähle eins welches von der Community schon komplett reverse-engineered wurde.
> also alle Kommunikation bekannt ist, und am besten auch befehle entgegennimmt
> (um die Mosfets am ausgang zu steuern). dies würde es dann in zukunft
> erleichtern es in das Modul einzubinden und dann die richtigen Daten auf dem
> Display anzuzeigen"

Damit ist die BMS-Wahl keine reine Schutzfrage mehr, sondern eine
**Schnittstellenentscheidung**: Sie bestimmt, ob der Roller später wieder einen
echten Ladestand anzeigen kann (§3.2, Punkt 2).

**Erfüllt vom JK-BMS** [REC]:

| Anforderung | Umsetzung |
|---|---|
| Vollständig reverse-engineered | `syssi/esphome-jk-bms` dokumentiert > 40 Modelle |
| Protokoll offengelegt | JK BMS RS485 Modbus V1.0 |
| **Befehle für die MOSFETs** | Schalter für Lade- und Entlade-MOSFET, Balancer, Ladegerät-Modus |
| Schnittstellen | UART-TTL, RS485, BLE; beim JK-PB **zwei RS485-Ports** |

Weitere Implementierungen: `Uksa007/esphome-jk-bms-can` (RS485 und CAN),
`Sleeper85/esphome-yambms` (neuere PB-Modelle).

> **Beim Kauf zu beachten:** Softwareversion **≥ 6.0**, sonst spricht das Gerät
> ein anderes Protokoll. Ein RS485-Port sollte für Rafflers Modul frei bleiben.

### Preise und Funktionsumfang des Moduls (Raffler, 2026-08-22)

Das Modul ist **nicht vorhanden**, sondern zu beschaffen. Der Preis setzt sich
aus Hardware und gewählten Funktionen zusammen:

| Baustein | Preis |
|---|---:|
| Hardware | 70 CHF |
| **Batteriesimulation** | **200 CHF** |
| Uhrzeit auf dem Display | 40 CHF — *in dieser Kombination geschenkt* |
| Originalbatterien auslesen, max. Ladezustand | 40 CHF — nicht nötig |
| Dashboard mit Rollerdaten | 40 CHF — nicht nötig |
| **Benötigt: Hardware + Batteriesimulation** | **270 CHF** |

**Die Batteriesimulation ist der Kern**, nicht ein Zusatz: Sie täuscht dem
Roller die Anwesenheit eines Akkus vor. Ohne sie gibt der Controller nicht frei.
Das Modul muss daher **vor dem Testlauf** vorliegen (§8.5).

### Rekuperation — vorerst nicht verfügbar

> „ich bin sehr zuversichtlich, dass ich das noch rauskriege, allerdings kann ich
> absolut keine Zeitangaben dazu machen. wenn ich dich wäre, würde ich davon
> ausgehen, dass du mittelfristig ohne reku fahren wirst."

**Wichtig: Es ist BMS-unabhängig.** Die Wahl des BMS schränkt die spätere
Nachrüstung nicht ein. Raffler will es selbst, weil er einen eigenen Umbau plant.

Praktische Folgen bis dahin: etwas geringere Reichweite im Stadtverkehr — bei
einem Roller typisch 5–15 % — und mehr Verschleiß an den mechanischen Bremsen.
Für die Auslegung des Packs ohne Belang; das BMS muss keinen Ladestrom vom
Motor aufnehmen.

### Schnittstelle zum BMS — noch offen

> „das koppeln mit dem BMS ist in einer ersten phase über Bluetooth gedacht.
> kann aber auch zusätzliche Hardware benötigen, ich weiss es schlicht und
> einfach nicht, am ende soll es ja zuverlässig laufen."

Die Anforderung aus §3.2 bleibt gültig — offengelegte Kommunikation, Befehle für
die Ausgangs-MOSFETs —, **über welche Schnittstelle sie läuft, ist aber offen**.
Das JK-BMS deckt mit Bluetooth, zwei RS485-Ports und CAN alle drei
Möglichkeiten ab und bleibt damit die richtige Wahl.

**Gegenleistung:** Raffler wünscht sich einen Erfahrungsbericht im
Elektroroller-Forum, sobald der Umbau läuft.

Kontakt: Telegram `t.me/raffler5`

---

### 3.3 Mechanische Anforderungen prismatischer Zellen

Aus dem EVE-Datenblatt LF105 (RD-LF105-S01-LF, Rev. C, Mar 2022), Abschnitte
6.2–6.4. Gilt sinngemäß für **alle** prismatischen Zellen, auch NMC. [Datenblatt]

### Verspannung — konstruktionsbestimmend

| Größe | Wert |
|---|---|
| Empfohlene Vorspannung | **3–5 kN** (≈ 300–500 kgf) |
| Maximal normal ertragbar | 7 kN |
| Innere Schäden ab | 9 kN |
| Leckage ab | 15 kN |
| **Ausdehnungskraft am Lebensende (EOL)** | **bis 30 kN** |
| Wirkfläche | 130,30 × 195,50 mm |

Prismatische Zellen quellen über ihre Lebensdauer auf. Wird das nicht durch
Vorspannung aufgenommen, delaminieren die Elektroden und die Kapazität bricht
ein. Die Zelldicke im Datenblatt (36,35 mm) gilt ausdrücklich **nur unter 300 kgf
Verspannung bei 30–40 % SOC** — ungespannt und voll geladen ist die Zelle dicker.

> **Folge für die Konstruktion:** Die Gewindestangen sind nicht bloß
> Gehäuseverbinder, sondern das **tragende Verspannelement**. Sie brauchen steife
> Endplatten, die 300–500 kgf flächig in den Zellstapel einleiten. Eine gedruckte
> Platte leistet das nicht — dort gehören Stahl oder Aluminium hin.

### Nachgiebigkeit ist kein Widerspruch zur Vorspannung

Die Zellen sollen unter Druck stehen — und der Druck darf trotzdem nicht
unkontrolliert steigen. Beides gehört zusammen.

Über die Lebensdauer dehnt sich eine Zelle **irreversibel** aus, durch
SEI-Wachstum und Gasbildung, bei LFP etwa 0,5–1 % der Dicke. Bei vier Zellen im
Stapel sind das **0,7–1,5 mm**. Läuft diese Dehnung gegen eine starre
Einspannung, explodiert die Kraft: [BER]

| | |
|---|---|
| Steifigkeit von 4 × M8 A2, 200 mm lang | ~139.000 N/mm |
| Kraftzuwachs bei 1,5 mm Dehnung | **rechnerisch 208 kN** |
| Innere Schäden laut Datenblatt ab | 9 kN |
| Leckage ab | 15 kN |

So weit kommt es nie — vorher gibt die Endplatte nach oder die Zelle wird
gequetscht. Genau das ist das Problem. **Die 30 kN, die das Datenblatt als
Ausdehnungskraft am Lebensende nennt, sind keine Eigenschaft der Zelle, sondern
die Folge einer zu steifen Einspannung.**

**Gewählt: Tellerfedern auf den Zugstangen.** Sie halten die Vorspannung und
nehmen die Alterungsdehnung auf. Mit rund 1.000 N/mm je Stapel steigt die Kraft
bei 1,5 mm Dehnung nur um 1,5 kN — von 4 auf 5,5 kN, deutlich unter der
9-kN-Grenze. Rund sechs Federn je Stange, Anordnung und Platzierung in
`konstruktion.md` §4.2.

**Verworfen: Schaumlagen zwischen den Zellen.** Sie leisten dasselbe, haben aber
drei Nachteile: Sie vergrößern die Zellteilung von 36,35 auf ~39,35 mm und damit
den nötigen Busbar-Lochabstand, sie isolieren die Zellen thermisch gegeneinander,
und ihre Kennlinie ist schwerer auszulegen als die einer genormten Tellerfeder.

### Wärmeabfuhr

| Richtung | Wärmeleitfähigkeit |
|---|---|
| in der Zellebene (X/Z) | 18–24 W/(m·K) |
| **durch die Zelldicke (Y)** | **1–2 W/(m·K)** |
| Wärmekapazität | 0,9–1,2 kJ/(kg·K) |

Wärme lässt sich über die großen Seitenflächen **kaum** abführen — der Weg dorthin
ist zehn- bis zwanzigfach schlechter leitend. Sie muss über Pole und Zellböden
raus. Das bestimmt, wo im Gehäuse Luft zirkulieren können muss.

Dazu passend eine Warnung aus Abschnitt 7.4 des Datenblatts: *„Do not use plastic
to encapsulate batteries or use plastic for electrical connection."* Gemeint ist
vor allem Vergießen, das die Wärmeabfuhr abschneidet; Kunststoffgehäuse mit
Luftraum sind branchenüblich. Für unseren Wandaufbau heißt das: **Luftspalt und
Wärmepfade einplanen, nicht dicht umschließen.**

### Zulässige Einbaulage — geklärt, stehend

Das EVE-Datenblatt enthält auf 44 Seiten **keine Aussage** zu Ventilorientierung
oder Einbaulage. Herstellerübergreifend gilt jedoch [REC]:

| Lage | Bewertung |
|---|---|
| **Pole oben, stehend** | **empfohlen** — das Sicherheitsventil arbeitet nur in dieser Lage bestimmungsgemäß |
| **Kopfüber** | **verboten** — Elektrolyt sammelt sich im Ventil und setzt es außer Funktion; bei Zellversagen tritt kochende leitfähige Flüssigkeit auf den Klemmenblock aus statt trockenem Gas |
| Auf der Kante liegend | nicht empfohlen, herstellerabhängig; teils Warnung vor verkürzter Lebensdauer |
| Flach auf der großen Fläche | schlechteste der liegenden Varianten |

**Zusätzlich scheitert liegende Montage hier an der Geometrie.** Alle Varianten
wurden gegen 270 × 215 × 430 mm gerechnet [BER]:

| Variante | Pole zeigen nach | Ergebnis |
|---|---|---|
| Auf Kante, Pole nach hinten | Tiefe | 200,5 mm Zelle + 7 mm Busbar/Mutter = 207,5 mm bei 207 mm Innenmaß → passt nicht |
| Auf Kante, Pole zur Seite | Breite | Pole hätten Platz, aber nur 5 × 3 = 15 Plätze; einer fehlt |
| Flach gestapelt, 8 Etagen | Tiefe | 16 Plätze, aber erneut 207,5 mm Polseite bei 207 mm → passt nicht |

Ursache ist strukturell: Die 200,5-mm-Achse trägt die Pole und passt bequem nur
in die 270-mm-Breite. Liegt sie dort, bleiben für die übrigen Achsen zu wenige
Zellplätze; legt man sie in die 215-mm-Tiefe, kollidieren Busbar und Polmutter
mit der Gehäusewand.

> **Entscheidung: stehende Montage, Pole oben.** Sicherheitstechnisch die
> empfohlene Lage, geometrisch die einzig mögliche — und der Lastpfad ist
> sauber, weil die Schwerkraft die Zellen auf die Bodenplatte drückt statt gegen
> eine Seitenwand. **Nicht erneut aufzurollen.**

---

## 4. Ströme

Anders als beim Original trägt in einem 16S1P-Pack **jede einzelne Zelle den
vollen Fahrstrom** — es gibt keine Parallelschaltung, die ihn aufteilt. Beim
Original teilten sich drei Packs den Strom, jeder trug ein Drittel. Damit ist die
Strombelastbarkeit der Zelle das **Auswahlkriterium Nummer eins**, noch vor
Kapazität und Preis.

Gerechnet für **16S LFP** (§3.1):

| Lastfall | Rechnung | Strom | Beleg |
|---|---|---|---|
| Spitze bei vollem Akku | 7.000 W ÷ 58,4 V | 120 A | [BER] |
| Spitze bei Nennspannung | 7.000 W ÷ 51,2 V | 137 A | [BER] |
| Spitze an der BMS-Abschaltung | 7.000 W ÷ 44,8 V | 156 A | [BER] |
| **Spitze bei absolut leerem Akku (Auslegungsfall)** | 7.000 W ÷ 40,0 V | **175 A** | [BER] |
| Dauer, Fahrprofil bis ~70 km/h | 2.300–3.300 W | 45–65 A | [ANN] |
| Dauer bei 100 km/h | ~5.000 W ÷ 51,2 V | ~98 A | [ANN] |

**Auslegungsvorgabe: 100 A Dauer, 180 A Spitze**, letzteres mit Reserve auf die
berechneten 175 A. [BER]

**Zur Zellgrenze:** Die LF105 ist mit 1C = 105 A Dauerstrom angegeben. Beim
realen Fahrprofil liegen 0,4–0,6C an, also reichlich Abstand. Erst Dauerfahrt
bei Höchstgeschwindigkeit träfe die Grenze — ein Fall, der bei diesem Fahrzeug
nicht vorkommt.

Die alte Spezifikation setzte 240 A an, abgeleitet aus einer Forenangabe
(„~14 kW laut BMS-Anzeige"), die deren Autor selbst als ungenau bezeichnete.
Gegen die belegte Maximalleistung von 7.000 W ist dieser Wert um 44 % zu hoch
und hätte ein unnötig teures BMS erzwungen.

---

## 5. Gewicht und Zuladung

| Rechnung | Wert | Beleg |
|---|---|---|
| Leergewicht ohne Akkus | 93,0 kg | [HB 70] |
| mit 3 Original-Kraftpaketen (+29,7 kg) | 122,7 kg | [BER] |
| Zuladung im Originalzustand | **157,3 kg** | [BER] |
| mit Ersatzpack 43,2 kg | 136,2 kg | [BER] |
| **Zuladung mit Ersatzpack** | **143,8 kg** | [BER] |

**Schlussfolgerung:** Das Gewicht ist keine bindende Randbedingung. Bei ~110 kg
tatsächlicher Nutzung (Fahrer 90 kg, Kleidung, Gepäck) bleiben rund 34 kg
Reserve. Die Packmasse stieg im Lauf der Konstruktion von geschätzten 36 auf
43,2 kg, weil das Aluskelett für die Zellverspannung hinzukam (§3.3).

Die 30-kg-Obergrenze der alten Spezifikation war unbegründet — sie war schlicht
das Gewicht der drei Originalakkus.

---

## 6. Bauraum

| Parameter | Wert | Beleg |
|---|---|---|
| Kraftpaket-Außenmaß | **90 × 215 × 410 mm** (B × T × H) | [MESS] |
| Grundriss-Form | **quaderförmig, nicht konisch** | [MESS] |
| Eckradius der Vertikalkanten | **5 mm** | [MESS] |
| Drei Packs nebeneinander | **270 × 215 × 410 mm** | [BER] |
| Bruttovolumen | **23,8 L** | [BER] |
| Einbaulage | Vollständig im Schacht versenkt | [MESS] |
| Schachttiefe, Gegenprobe mit Zollstock | bestätigt 410 mm | [MESS] |
| **Lastpfad** | Akku **steht auf dem Schachtboden auf** | [MESS] |

Die alte Spezifikation nannte 210 × 90 × 340 mm und daraus 19,3 L. Die Höhe war
um 70 mm zu klein und die Achsen waren vertauscht. Beide Fehler zusammen führten
dort zur Fehlentscheidung, prismatische Zellen zu verwerfen.

### Schachtgeometrie

Der Schacht ist **kein Quader mit Trennkammern**, sondern **ein durchgehender
Raum, in den vertikale Führungsrippen hineinragen**. Die Kraftpakete haben
abgerundete Vertikalkanten; wo zwei Packs aneinanderstoßen, klafft an Vorder- und
Rückseite zwischen den beiden Rundungen ein Zwickel auf. Genau dort greifen die
Rippen ein. [MESS]

**Konsequenz für das Gehäuse:** Die Außenkontur ist nicht der Hüllquader, sondern
die **Vereinigungsmenge der drei nebeneinandergestellten Kraftpaket-Konturen** —
ein Körper von 270 × 215 × 410 mm mit vier abgerundeten Außenkanten und
eingeformten Zwickelnuten an den ehemaligen Trennebenen. Diese Kontur passt per
Konstruktion und wird von den Original-Rippen geführt. Bei 5 mm Eckradius kostet
sie nur rund **26 ml, also 0,11 % des Volumens** — vernachlässigbar. [BER]

Rechenweg je Kante: (1 − π/4) × 5² × 410 mm = 2,2 ml; vier Außenkanten plus acht
Kanten, die zu Zwickeln werden, ergeben ~26 ml.

**Der Zwickel ist klein.** Bei 5 mm Radius stoßen an einer Trennebene zwei
Viertelrundungen aufeinander; der freie Querschnitt misst nur etwa 10 × 5 mm. Die
eingreifende Rippe kann also höchstens ~8 × 4 mm stark sein. Für die Führung
eines 9,9-kg-Akkus ist das filigran — beim Messen prüfen, ob die Rippen
tatsächlich nur in diesen Zwickel greifen oder ob sie zusätzlich in eine Nut der
Akkuwand fassen. Siehe `messprotokoll.md`, M10.

Innen bleibt der Raum durchgehend und ungeteilt. Ein Wegfräsen der Rippen ist
**nicht erforderlich** — der Umbau bleibt reversibel.

### Schachtgeometrie — Befund aus dem Testring T-01 (2026-08-21)

**Der erste Testdruck passt nicht.** Damit hat das Musterstück genau geleistet,
wofür es gebaut wurde: Der Fehler kostete zwei Stunden Druckzeit statt 32
Stunden und 3,4 kg beim Vollteil — und wäre sonst erst beim Zusammenbau mit
fertig verspanntem Zellstapel aufgefallen.

**Es gibt zwei Arten von Rippen, nicht eine.** [MESS]

| Art | Anzahl | Vorstand | Bedeutung |
|---|---|---|---|
| **Separationsrippen** | 2 | **10 mm** | trennen die Akkufächer, drücken die Akkus auseinander |
| Versteifungsrippen | 6–7 | 1–2 mm | Spritzgussversteifung der Wanne, **irrelevant** |

Die bisherige Konstruktion setzte voraus, dass die Separationsrippen in die
**Rundungszwickel** zwischen den Akkus greifen. Das ist geometrisch unmöglich:
Bei 5 mm Eckradius ist ein Zwickel 10 mm breit und **5 mm tief** — eine Rippe
mit 10 mm Vorstand passt nicht hinein. Die Akkus stehen deshalb mit einem echten
Spalt nebeneinander, und der Schacht ist breiter als die angenommenen 270 mm.

Eine 10-mm-Nut in einer 8-mm-Wand ist zudem kein Nut, sondern ein Durchbruch.
Die Wand müsste auf 13 mm wachsen und kostete 10 mm Innentiefe — bei einem BMS,
das mit 24 mm Dicke ohnehin knapp sitzt, nicht tragbar.

**Beschluss: Die beiden Separationsrippen werden entfernt.** [Christoph]
Die Versteifungsrippen bleiben und werden mit 2 mm Vorstand berücksichtigt.

Das vereinfacht die Konstruktion an drei Stellen:

| | mit Nuten | ohne |
|---|---:|---:|
| Außenkontur | Vereinigung dreier Fachgrundrisse | **schlichter Quader mit Eckradius** |
| Stirnwand | 8,0 mm (wegen Nuttiefe) | **5,0 mm** |
| frei für BMS | 37,6 mm | **39,6 mm** |
| Spiel in der Breite je Seite | 1,7 mm | **abhängig von der Messung, vermutlich deutlich mehr** |

> **[OFFEN] Zwei Maße nach dem Entfernen:** lichte Weite in der Breite und
> lichte Tiefe bis zur Vorderkante der verbliebenen Versteifungsrippen.
> Blockiert: die Außenkontur.

### Bauhöhe — bestätigt (2026-08-21)

Mit einer auf **425 mm** abgelängten Stahlstange in der vorderen Ecke schließt
die Sitzbank noch. [MESS] Die Konstruktion braucht exakt 425 mm — sie passt
also, aber ohne jede Reserve. Hinten stehen rund **50 mm mehr** zur Verfügung.

Ein gestuftes Gehäuse ist damit **nicht erforderlich**. Stattdessen sind die
**oberen Außenkanten des Deckels zu fasen**: Eine schwenkende Sitzbank
beschreibt einen Kreisbogen, und die obere Außenkante ist der Punkt, der ihm am
nächsten kommt. Bei null Reserve schafft die Fase Freiraum genau dort, ohne in
der Mitte Bauhöhe zu kosten.

### Bodenkontakte — Ausbau beschlossen (2026-08-21)

Am Schachtboden sitzen **drei** Leistungssteckkontakte, je **ca. 20 mm hoch**.
[MESS] Sie greifen in Taschen an der Unterseite des Kraftpakets. Ein Gehäuse mit
planer Unterseite würde auf ihnen aufsitzen und 20 mm Bauhöhe verlieren.

**Entscheidung: Kontakte ausbauen, Direktverkabelung** statt Nutzung der
Originalkontakte.

| | mit Kontakten | ohne |
|---|---|---|
| Nutzbare Bauhöhe | 410 mm | **430 mm** |
| Bodenplatte | drei Aussparungen, an den Traglaststellen geschwächt | **durchgehend eben** |
| Lasteinleitung | um die Taschen herum | **flächig** |
| Kabeldurchführung | neue Durchbrüche nötig | **die freiwerdenden Kontaktöffnungen** |

**Preis:** Nach dem Ausbau lässt sich kein Originalakku mehr einsetzen. Da diese
defekt und nicht mehr beschaffbar sind, vertretbar — aber es ist der Punkt, ab
dem der Umbau nicht mehr rückgängig ist.

**Folge:** Der 12-V-Backup-Pfad (§8.1) wird damit nicht mehr automatisch bedient
und muss separat gelöst werden. Christoph klärt das mit Raffler. **[OFFEN]**

**Lastpfad geklärt:** Der Akku steht mit seiner Unterseite auf dem Schachtboden
auf, er hängt nicht an Auflagen. [MESS] Die Zellmasse wird also über den
Gehäuseboden nach unten abgetragen.

**Die Laststeigerung ist geringer als sie scheint.** 43,2 kg gegenüber 9,9 kg je
Originalakku klingt nach dem Vierfachen, doch die Last verteilt sich auf **alle
drei Fachflächen**:

| | Original, 3 Packs | Ersatzpack |
|---|---|---|
| Masse | 29,7 kg | 43,2 kg |
| Auflagefläche | 58.050 mm² | 58.050 mm² |
| Flächenpressung | 0,0050 N/mm² | **0,0073 N/mm²** — **+45 %** |

Bedingung ist, dass die Bodenplatte eben aufliegt. Nach Ausbau der
Steckkontakte (§6) ist der Schachtboden plan, und der Gehäuseboden liegt
vollflächig auf — er kann sich deshalb gar nicht durchbiegen und braucht keine
Verrippung. [BER]

> **[OFFEN] — noch abzunehmen:** Querschnitt und Höhenerstreckung der
> eingreifenden Rippen; Lage und Höhe der Bodenkontakt-Aussparungen; Anteil des
> Griffs an der Gesamthöhe von 410 mm. Siehe `messprotokoll.md`.
> Blockiert: Innenaufteilung, nicht mehr Außenkontur oder Lastpfad.

---

## 7. Konstruktionsentscheidungen

Getroffen am 2026-08-20, jeweils mit Begründung.

### 7.1 Zellbauform: prismatisch

14 große prismatische Zellen statt ~280 Rundzellen.

| | prismatisch | Rundzellen 21700 |
|---|---|---|
| Zellzahl | 14 | ~280 |
| Verbindung | 14 Schraubverbindungen | ~600 Punktschweißungen |
| Werkzeugbedarf | Schraubenschlüssel | Punktschweißgerät, Nickelband |
| Balancing-Abgriffe | 15 | 15 |

Da der Bauraum mit 23,8 L reichlich ist und das Gewicht nicht bindet, entfällt
der einzige echte Vorteil der Rundzellen — ihre bessere Anpassbarkeit an
verwinkelte Geometrie.

### 7.2 Chemie: LiFePO4, 16S

Siehe §3.1. Das Original ist 14S NMC (§3.0); der Ersatzpack wird 16S LFP, weil
alle drei ursprünglichen Gegenargumente entfallen sind und LFP bei
Beschaffbarkeit, Preis, Zyklenzahl und Thermik überlegen ist.

### 7.3 Gehäuse: Eigenbau, zweiteilig, mit Zugstangen

Das Original-Gehäuse wird **nicht** wiederverwendet (Entscheidung Christoph).

Der Bauraum des BambuLab H2S beträgt 340 × 320 × 340 mm [REC]. Ein Gehäuse von
410 mm Höhe ist damit **nicht am Stück druckbar**. Konstruktionsprinzip daher:

- **zwei übereinanderliegende Segmente**, je ~205 mm hoch
- verbunden durch **durchgehende Gewindestangen** in senkrechten Bohrungen, die
  die gesamte Gehäusehöhe durchdringen
- Zugstangen an den vier Außenecken **plus zwei mittig** in dem Wandmaterial, das
  die Zwickelnuten ohnehin bereitstellen — sonst bliebe die Mitte über 270 mm
  Breite unverspannt

**Nebeneffekt Montage:** Der 43 kg schwere Pack wird nicht als Ganzes in den
410 mm tiefen Schacht gehoben, sondern dort etagenweise aufgebaut: untere Hälfte
(~18 kg) einsetzen, obere aufsetzen, dann Zugstangen durchstecken und verspannen.
Dieselben Stangen verspannen im selben Zug den Zellstapel gegen Vibration.

### 7.4 Kapazitätsziel

**16 × 105 Ah = 5,38 kWh** statt der Parität von 4,33 kWh, also **+24 %
Reichweite** für rund 2 kg Mehrgewicht gegenüber den Originalzellen.
Rechnerische Reichweite: 5.376 Wh ÷ 54 Wh/km ≈ **100 km** real. [BER]

**Zellformat, herstellerbelegt:** EVE LF105, 200,5 × 130,3 × 36,35 mm, 1,98 kg,
Innenwiderstand < 0,35 mΩ, > 6.000 Zyklen. Datenblatt RD-LF105-S01-LF Rev. C.
Anordnung: zwei Etagen à acht Zellen, siehe `konstruktion.md` §3.

---

## 8. Rollerseitige Integration

### 8.1 Anschluss an den Roller — geklärt (Raffler, 2026-08-21)

**Die Handbuchstelle zum vorderen Steckplatz ist irreführend.** [HB 33] schreibt,
das Kraftpaket müsse „mindestens 4 Stunden im **vorderen** Steckplatz" stecken,
um den 12-V-Backup-Akku zu laden. Daraus war hier zunächst eine Sonderfunktion
dieses Platzes abgeleitet worden. Raffler widerspricht eindeutig:

> „die Anschlüsse sind alle Parallel verbunden und gehen über einen
> Sicherungskasten dann alle direkt und zusammen an den Einzigen anschluss am
> Motorcontroller. […] Buchse1 = 12v wird geladen ist mist. der Roller hat 0.00
> möglichkeit herauszufinden auf welcher position dass ein akku sitzt."

Die Handbuchangabe ist eine Vereinfachung für die Bedienungsanleitung. Es gab
ein Modell mit nur einem Port; offenbar sollte eine einzige Anleitung für alle
Varianten reichen. **Der 12-V-Pfad ist damit kein offener Punkt mehr.**

### Topologie

```
Port 1 ┐
Port 2 ┼─ parallel ─→ Sicherungskasten ─→ Motorcontroller (ein Anschluss)
Port 3 ┘
```

| Größe | Wert | Quelle |
|---|---|---|
| Strombelastbarkeit je Port | **100 A** | Raffler |
| Alle drei Ports zusammen | **300 A** | Raffler |
| Benötigt (Spitze) | 180 A | [BER] |

**Ein Port allein trägt unseren Spitzenstrom nicht.** Vorgehen nach Rafflers
Empfehlung: die Leitungen aller drei Ports zusammenführen. Das ist zugleich die
praktischere Lösung — 180 A über eine einzelne Leitung erforderten 35–50 mm²,
die sich im Fahrzeug kaum verlegen lassen; drei vorhandene Leitungen parallel
lösen das mit dem, was schon verbaut ist.

Rafflers Präferenz: *„Wenn ich dich wäre würde ich die Buchsenbox sowieso
komplett entfernen und deine neue batterie direkt über die Kabel verbinden."*
Das deckt sich mit der ohnehin getroffenen Entscheidung, die Steckkontakte
auszubauen (§6).

### Datenpin-Schleife — zwingend

> „Wichtig sind, die datenpins an den Ports, der Roller erkennt, ob der Kreis
> geschlossen ist. machst du die die Buchsenbox auf im roller, so kannst du die
> zwei sich darin befindenden kabel einfach zusammenstecken, und dann ist der
> kreis immer geschlossen."

Der Roller prüft über die Datenpins, ob ein Stromkreis geschlossen ist, und gibt
sonst nicht frei — **unabhängig vom CAN-Modul**. Beim Ausbau der Buchsenbox sind
diese beiden Leitungen dauerhaft zu brücken.

> **Nebenwirkung, bewusst hinzunehmen:** Mit dauerhaft geschlossener Schleife
> kann der Roller nicht mehr erkennen, ob ein Akku fehlt oder unvollständig
> sitzt. Bei einem fest verbauten Pack ist das ohne Belang, es entfällt aber eine
> Schutzfunktion.

### Sicherungskasten

Der fahrzeugseitige Sicherungskasten liegt **hinter** den Ports und bleibt im
Leistungspfad. JJac berichtet von 3 × 60 A parallel [Forum, unbelegt], was zu
drei Ports à 100 A passt. Vor Inbetriebnahme prüfen, ob die dortige Absicherung
zu 180 A Spitzenstrom passt.

### 8.2 Ladestrategie — Teilladung wegen der Wohnlage

**Der Wohnort ist eine Anforderung an das Fahrzeug.** Christoph wohnt auf
**800 m Höhe; jede Fahrt beginnt bergab.** Das macht aus der fehlenden
Rekuperation (§3.2) kein Reichweiten-, sondern ein thermisches Problem:

| | |
|---|---|
| Lageenergie bei 500 m Höhendifferenz, 230 kg | 1,13 MJ = **0,31 kWh** |
| Bei 10 % Gefälle und 40 km/h | ~1.600 W Dauerbremsleistung |
| Über 5 km Abfahrt | **730 kJ** in die Bremsen |
| Entspricht | ~33 Vollbremsungen aus 50 km/h hintereinander |

Rollerbremsen sind klein dimensioniert; Fading auf einer langen Abfahrt ist ein
reales Risiko, kein theoretisches.

**Rekuperation allein löst das nicht.** Ein voller Pack nimmt keine Ladung auf —
das BMS sperrt bei Erreichen des Ladeschlusses, und der Controller bekäme
dieselbe Absage wie heute. Rekuperation hilft ausgerechnet dann nicht, wenn sie
am dringendsten gebraucht wird: bei der ersten Abfahrt nach dem Laden.

**Lösung: nicht voll laden.** Christoph praktiziert das bereits mit den
Originalakkus (85 % über eine externe Ladekonstruktion) und führt es mit dem
neuen Pack fort. [Christoph, 2026-08-22]

| | |
|---|---|
| Reserve bei 85 % Ladung | 0,81 kWh |
| Benötigt für 500 Höhenmeter | ~0,2 kWh nutzbar |
| **Reicht rechnerisch für** | **~1.200 Höhenmeter** |

Der Nebeneffekt ist erwünscht: **Ein LFP-Pack, der nicht bis 3,65 V geladen
wird, hält deutlich mehr Zyklen.**

### Teilladung bei LFP ist unschärfer als bei NMC

Das Datenblatt definiert die Standardladung als CC bis 3,65 V, danach CV bis der
Strom auf 0,05C fällt — erst die CV-Phase bringt die letzten Prozente.

Die **LFP-Kennlinie ist flach**: Zwischen 20 % und 90 % ändert sich die
Zellspannung nur um wenige Zehntelvolt, erst am Ende steigt sie steil an. Eine
Ladeschlussspannung trifft den Ladestand deshalb ungenauer als bei den
NMC-Originalzellen. Richtwerte bei 0,3–0,5C: [REC]

| Ladeschluss je Zelle | Pack | ungefährer SoC |
|---|---:|---:|
| 3,65 V mit voller CV-Phase | 58,4 V | 100 % |
| 3,45 V | 55,2 V | ~95 % |
| 3,40 V | 54,4 V | ~90 % |
| **~3,38 V** | **~54,0 V** | **~85 %** |
| 3,35 V | 53,6 V | ~80 % |

Die Werte schwanken mit Temperatur und Alterung; genauer als „ungefähr" wird es
über die Spannung bei LFP nicht.

> **Folge für die Beschaffung:** Das Ladegerät braucht eine **einstellbare
> Ausgangsspannung**. Ein fest auf 58,4 V eingestelltes Gerät lädt immer voll
> und macht die Teilladung unmöglich. Die Alternative — den Ladeschluss im BMS
> abzusenken — funktioniert, macht das BMS aber vom Schutzorgan zum
> Betriebsmittel und lässt es bei jeder Ladung abschalten.

> **Im Winter bleibt ein Rest.** Unter 0 °C darf LFP nicht geladen werden; das
> BMS sperrt dann unabhängig vom Ladestand. Bei Frost geht es in jedem Fall auf
> den Bremsen ins Tal.

### 8.3 Ladegerät

Das Serien-Ladegerät liefert 59 V / 6 A = 354 W [HB 69]. Für den 5,18-kWh-Pack
ergäbe das **rund 15 Stunden** Ladezeit. [BER]

Empfehlung: Aftermarket-Ladegerät 58,8–59 V CC/CV. Bei 15 A rund 6 h, bei 20 A
rund 4,5 h. [BER]

### 8.4 Fehlercodes des Originalsystems

Zur Einordnung späterer Fehlerbilder [HB 67]: E114 Kurzschluss im Roller /
Softwareproblem im Motorcontroller · E131 Überspannung · E142 Akku leer ·
E155 Akku zu warm zum Laden (> 45 °C) · E166 Akku zu kalt · E2XX schwerer Fehler.
Diese Codes werden im **Display des Akkus** angezeigt, nicht im Roller — sie
entfallen mit dem Umbau.

---

## 8.5 Vorgehensreihenfolge — Erprobung vor irreversiblen Eingriffen

**Grundsatz (Christoph, 2026-08-21):** Die Separationsrippen werden erst
entfernt, wenn der Umstieg endgültig ist. Vorher muss der Roller mit den echten
Zellen und dem echten BMS gelaufen sein.

Zwei Eingriffe sind unumkehrbar und schließen die Rückkehr zu den Originalakkus
aus: der **Ausbau der Bodenkontakte** (§6) und das **Entfernen der
Separationsrippen** (§6). Beide dürfen erst erfolgen, wenn feststeht, dass das
neue System funktioniert.

### Der erste Funktionstest braucht kein Gehäuse

Der Pack lässt sich **außerhalb des Fahrzeugs** aufbauen und anschließen:
sechzehn Zellen zwischen zwei Platten mit Gewindestangen verspannt, auf dem
Werkstattboden, mit zwei Leitungen in den Schacht zu den Portkabeln. Damit ist
alles Wesentliche prüfbar, **bevor ein Millimeter Gehäuse gedruckt ist**:

| Prüfung | klärt |
|---|---|
| Roller einschalten | Gibt der Controller frei? Datenpin-Brücke und CAN-Modul korrekt? |
| Rad aufgebockt drehen lassen | Läuft der Motor? Reagiert die Leistungsregelung? |
| Voller Pack bei 58,4 V | **Verträgt der Controller die Spannung?** Nur 1,6 V Abstand zur 60-V-Grenze |
| Last aufnehmen | Verhalten des BMS, Spannungseinbruch, Erwärmung |
| Laden | Ladegerät, Balancing, Abschaltverhalten |

Scheitert etwas, sind die Zellen unbeschädigt und wiederverwendbar, und am
Fahrzeug ist nichts verändert.

**Der Aufbau bildet die spätere Verschaltung eins zu eins ab:** zwei Blöcke zu
acht Zellen, nur nebeneinander statt in zwei Etagen. Damit gilt der
Verschaltungsplan unverändert. Zeichnung: `testaufbau.html` (ZB-16-004).

| | |
|---|---|
| Block, 8 Zellen aufrecht | 291 × 130 mm |
| beide Blöcke | 291 × 261 mm |
| Höhe mit Polen | 200,5 mm |
| Verspannung je Block | 2 Holzplatten 18 mm, 4 Gewindestangen M8 |

> **Auch im Test verspannen — und zwar mit Federn.** Die Zellen atmen bei jedem
> Ladezyklus, nicht erst über Jahre: Laut Datenblatt steigt die Kraft schon an
> einer neuen Zelle um **bis zu 3 kN**, wenn sie starr eingespannt ist. Mit
> 3–4 kN Vorspannung landet man bei 6–7 kN, also unter der Schadensgrenze von
> 9 kN, aber ohne Reserve. Mit Tellerfedern bleibt es bei rund 5 kN. Sie werden
> ohnehin beschafft; sie hier wegzulassen spart nichts.

**Pole zeigen nach oben**, auch im Testaufbau — das Berstventil arbeitet nur in
dieser Lage bestimmungsgemäß (§3.3).

### Reihenfolge

| # | Schritt | umkehrbar? |
|---|---|---|
| 1 | Zellen einzeln auf Ruhespannung prüfen | ja |
| 2 | Pack **außerhalb** verspannen und verschalten, BMS anschließen | ja |
| 3 | Datenpin-Schleife brücken, CAN-Modul einschleifen | ja |
| 4 | **Funktionstest am aufgebockten Roller** | ja |
| 5 | Provisorisches Gehäuse, **Probefahrt** | ja |
| 6 | Bodenkontakte ausbauen | **nein** |
| 7 | Separationsrippen entfernen | **nein** |
| 8 | Schacht ausmessen, Kontur anpassen, Gehäuse drucken | — |
| 9 | Endgültiger Einbau | — |

**Warum Schritt 5 überhaupt nötig ist:** Für eine Probefahrt auf der Straße muss
der Pack gesichert im Fahrzeug sitzen — aufgebockt lässt sich das Fahrverhalten
unter realer Last nicht beurteilen. Das Provisorium muss dafür in den
**unveränderten** Schacht passen, also die 10 mm vorstehenden Separationsrippen
umgehen: rund 205 mm Außentiefe statt 211 mm. Passgenauigkeit ist nebensächlich,
das Teil muss einen Fahrversuch überstehen.

Wer nur aufgebockt testen will, kann Schritt 5 überspringen und nach dem
Ausmessen direkt das endgültige Gehäuse bauen.

### Ein Test mit weniger Zellen lohnt nicht

Elektrisch wäre er möglich — Raffler ist probeweise mit 36 V gefahren, was etwa
11S bis 12S entspräche. Dagegen sprechen drei Punkte [BER]:

- **Kein Kostenvorteil.** Die Zellen werden ohnehin alle gekauft. Und bei 16S1P
  ohne Parallelschaltung müssen **alle sechzehn aus derselben Charge** stammen:
  Die schwächste bestimmt die Packkapazität, ein Ausgleich existiert nicht.
- **Der kritische Punkt bliebe ungeprüft.** Ein 12S-Pack käme auf 43,8 V und
  ließe die Frage offen, ob der Controller die 58,4 V verträgt — genau das
  Risiko, um das es geht.
- **Keine kleinere Bauform.** Ab neun Zellen braucht es ohnehin zwei Etagen; die
  Bauhöhe bliebe bei 425 mm.

---

## 9. Rechtlicher Rahmen

Kein Rechtsrat. Der 54 ignite fährt 100 km/h [HB 6] und ist damit ein Fahrzeug
der Klasse L3e, nicht ein Kleinkraftrad.

- Eingriffe in den Antriebsstrang berühren die Betriebserlaubnis. Die
  **Spannungslage bleibt praktisch unverändert** — 51,2 V nominal und 58,4 V
  Ladeschluss gegenüber 50,6 V und 58,8 V im Original —, obwohl die Zellzahl von
  14 auf 16 steigt und die Chemie wechselt. Die Motorleistung bleibt unberührt.
  Mit einer Prüforganisation ist zu klären, was konkret abnahmepflichtig wird.
- Der Versicherungsschutz im öffentlichen Raum hängt an einer gültigen
  Betriebserlaubnis.
- Reverse Engineering des eigenen Fahrzeugs zu Reparatur- und
  Interoperabilitätszwecken ist in der EU grundsätzlich zulässig. Nachbau der
  CAN-Platine für den Eigengebrauch ist unproblematisch; Weiterverbreitung oder
  Verkauf kann Schutzrechte berühren.

---

## 10. Offene Punkte

Nach blockierender Wirkung sortiert.

| # | Punkt | Blockiert | Abschnitt |
|---|---|---|---|
| 1 | Rippenquerschnitt (M10), Bodenaussparungen (F1), Griffanteil an der Höhe (M7/M8) | Innenaufteilung | 6 |
| 2 | Konkrete Zelle wählen (Maße, Datenblatt, Bezugsquelle) | gesamte Innenaufteilung | 7.4 |
| 3 | Absicherung im fahrzeugseitigen Sicherungskasten gegen 180 A prüfen | Inbetriebnahme | 8.1 |
| 5 | BMS wählen: **16S LFP**, 150 A Dauer, 250 A Spitze, aktiver Balancer | Elektrikplanung | 4 |
| 6 | Ladegerät 58,8–59 V CC/CV, 15–20 A | — | 8.2 |
| 7 | Zulassungsbescheinigung Teil I, Felder F.1 und G | Gewichtsnachweis | 1 |
| 8 | Prüforganisation zu Abnahmepflicht kontaktieren | Zulassung | 9 |
| 9 | Leistungsverkabelung, Hauptsicherung, Vorladewiderstand | Elektrikplanung | — |

---

## 11. Verworfene Optionen

Damit die Diskussion nicht im Kreis läuft.

| Option | Verworfen weil | Datum |
|---|---|---|
| Rundzellen 21700 | ~600 Punktschweißungen ohne Gegenwert, da Bauraum reichlich und Gewicht nicht bindend | 2026-08-20 |
| Original-Gehäuse wiederverwenden | Entscheidung Christoph | 2026-08-20 |
| Trennrippen wegfräsen | Nicht nötig, da Volumen reichlich; erhält Reversibilität und Führungsfunktion | 2026-08-20 |
| 30-kg-Gewichtsobergrenze | Unbegründet; 151 kg Zuladung bleiben auch mit 36-kg-Pack | 2026-08-20 |
| **14S NMC für den Ersatzpack** | Alle drei Gegenargumente zu LFP entfielen (Ladegerät wird ohnehin ersetzt, das CAN-Modul leitet keinen Ladestand ab, Stromreserve reicht beim realen Fahrprofil). Zugleich ist NMC prismatisch in Europa kaum beschaffbar, teurer und hält ~800 statt > 6.000 Zyklen. §3.1 | 2026-08-21 |
| Schaumlagen zwischen den Zellen | Tellerfedern auf den Zugstangen leisten dasselbe, ohne die Zellteilung und damit das Busbar-Maß zu verändern, ohne thermische Isolierung zwischen den Zellen und mit genormter Kennlinie. §3.3 | 2026-08-22 |
| Liegende Zellmontage | Ventil arbeitet nur bei Polen oben bestimmungsgemäß; zusätzlich scheitern alle liegenden Varianten geometrisch (§3.3) | 2026-08-20 |
| Erhalt des OEM-BMS | Es ist die Fehlerquelle: Flottenmanagement-BMS mit GPS/GSM, Backend nicht mehr verfügbar | vorab |

---

## 12. Quellen

1. **Benutzerhandbuch Kumpan 54 ignite**, Kumpan electric, 75 Seiten, erstellt
   2020-10-01. Primärquelle für alle **[HB]**-Angaben; die Zahl dahinter ist die
   Seite im Dokument. **Nicht Teil dieses Repositories** — das Handbuch ist
   urheberrechtlich geschützt und wird hier nur zitiert, nicht weitergegeben.
   Fahrzeughalter erhalten es über Kumpan electric bzw. den Rechtsnachfolger.
2. **`Materials/IMG_6165–6167.jpeg`** — Fotos von Akku und Schacht, 2026-08-20.
3. **Referenzumbau JJac**, Elektroroller-Forum —
   https://www.elektroroller-forum.de/viewtopic.php?p=414287#p414287
   14S-Umbau an einem 54 Ri mit CAN-Modul von „Raffler". Erfahrungsbericht,
   keine belegte Quelle; Zahlenangaben dort vom Autor selbst als ungenau
   bezeichnet.
4. **BambuLab H2S Bauraum** — https://bambulab.com/en-us/h2s
5. **`spezifikation.md`** — **veraltet.** Enthält nachweislich falsche Werte bei
   Bauraum, Kapazität, Spitzenstrom und Gewichtsgrenze. Nur noch als
   Diskussionsverlauf zu lesen, nicht als Datenquelle.
