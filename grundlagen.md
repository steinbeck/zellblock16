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

Die Technische-Daten-Seite [HB 69] nennt gerundet „51 V / 29 Ah / 1.470 Wh".
Maßgeblich ist die präzisere Angabe der Akkuseite [HB 27].

**Paritätsziel für den Ersatzpack:** 3 × 1.442 Wh = **4.326 Wh**. [BER]

**Realverbrauch:** 4.326 Wh ÷ 80 km = **54 Wh/km**. [BER]
Nach Prüfnorm: 1.442 Wh ÷ 36,5 km = 39,5 Wh/km. [BER]

---

## 3. Zellkonfiguration — 14S NMC, belegt

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
- 16S LFP: **nicht ausgeschlossen**, siehe §3.1. Für das *Original* gilt der
  Beleg eindeutig 14S NMC; für den Ersatzpack ist LFP eine offene Rückfalloption,
  da das Ladegerät ohnehin ersetzt wird.

### Damit gesetzte Auslegung des Ersatzpacks

| Parameter | Wert | Beleg |
|---|---|---|
| Konfiguration | **14S**, NMC | [BER] aus [HB 69] |
| Nennspannung | 51,8 V (14 × 3,7 V) | [BER] |
| Ladeschluss | **58,8–59,0 V** | [HB 69] |
| Entladeschluss | ~42 V (14 × 3,0 V) | [ANN] |

### 3.1 LFP als Rückfalloption — offen, nicht verworfen

**Status: Plan B.** Primärpfad bleibt 14S NMC. LFP mit 16S ist nicht
ausgeschlossen und wird für den Fall vorgehalten, dass die NMC-Beschaffung
scheitert — nach der Kostenrecherche (`kosten.md`) ein realistisches Szenario.

**Spannungsfenster sind nahezu deckungsgleich** [BER]:

| | 14S NMC | 16S LFP |
|---|---|---|
| leer | 42,0 V | 40,0 V |
| nominal | 50,6 V | 51,2 V |
| voll | 58,8 V | 58,4 V |

Das frühere Ausschlussargument „Ladegerät liefert 59 V" trägt **nicht mehr**: Das
Serien-Ladegerät wird ohnehin ersetzt, weil seine 6 A für den neuen Pack 15 h
Ladezeit bedeuten (§8.2). Ein neues Gerät wird auf 58,4 V eingestellt. Die 59 V
bleiben wertvoll als **Beleg** für 14S NMC im Original, sind aber kein Zwang für
den Ersatzpack.

**Für LFP:**
- deutlich bessere Beschaffbarkeit in Europa — mit Datenblatt und Gewährleistung
- thermisch erheblich gutmütiger; relevant bei einem fest verbauten Pack, der in
  der Garage steht
- ~5.000 statt ~1.500 Zyklen
- standardisierte Formate, verlässliche Datenblätter

**Gegen LFP — zwei harte, ein weiches Argument:**

1. **[OFFEN] Bauform.** Das im LFP-Markt normierte Höhenmaß von ~200 mm
   kollidiert mit unseren 410 mm Bauhöhe. Gerechnet an der EVE LF105
   (200,5 × 130,3 × 36,7 mm) [REC]: Zwei Etagen ergeben 401 mm und lassen 9 mm
   für Boden, Zwischenlage und Deckel — unmöglich. Eine Etage fasst auf
   270 × 215 mm nur 10–12 Zellen, benötigt werden 16. **Für LFP ist zwingend ein
   flacheres Zellformat zu finden.** Zum Vergleich NMC (173 × 126 × 45 mm):
   drei Etagen à 126 mm = 378 mm, 32 mm Reserve, 18 Plätze für 14 Zellen. [BER]
2. **[OFFEN] SoC-Ermittlung.** Leitet Raffis CAN-Modul den Ladestand aus der
   Packspannung ab, ist LFP raus — die flache Entladekurve ließe die Anzeige
   ewig auf „voll" stehen und dann schlagartig fallen. Bezieht das Modul den
   Wert vom BMS, ist der Punkt erledigt. **Zu klären mit Raffler.**
3. Stromreserve. Bei 105 Ah ist der Dauerstrom auf 1C begrenzt. Bei Christophs
   Fahrprofil (innerorts und Landstraße bis ~70 km/h, entsprechend 45–65 A =
   0,4–0,6C) ist das unkritisch. Erst Dauerfahrt bei 100 km/h träfe die Grenze.
   [BER] Dieses Argument trägt hier also kaum.

**Entscheidungsweiche:** Rückmeldung von Raffler zu Punkt 2, dann Zellsuche zu
Punkt 1. Bis dahin wird beides offengehalten.

> **Wichtig für die Arbeitsplanung:** Die Chemiefrage blockiert **nicht** das
> Gehäuse-Außenmodell. Außenkontur, Wandaufbau, Zugstangen und Bodenplatte sind
> von 14S NMC gegen 16S LFP unberührt — betroffen ist allein die
> Innenaufteilung. An der Außenkontur kann parallel gearbeitet werden.

---

## 4. Ströme

Anders als beim Original trägt in einem 14S1P-Pack **jede einzelne Zelle den
vollen Fahrstrom** — es gibt keine Parallelschaltung, die ihn aufteilt. Beim
Original teilten sich drei Packs den Strom, jeder trug ein Drittel. Damit ist die
Strombelastbarkeit der Zelle das **Auswahlkriterium Nummer eins**, noch vor
Kapazität und Preis.

| Lastfall | Rechnung | Strom | Beleg |
|---|---|---|---|
| Spitze bei vollem Akku | 7.000 W ÷ 59,0 V | 119 A | [BER] |
| Spitze bei Nennspannung | 7.000 W ÷ 50,6 V | 138 A | [BER] |
| **Spitze bei leerem Akku (Auslegungsfall)** | 7.000 W ÷ 42 V | **167 A** | [BER] |
| Dauer bei zügiger Fahrt | ~4.500 W ÷ 50,6 V | ~89 A | [ANN] |

**Auslegungsvorgabe: 100 A Dauer, 180 A Spitze**, letzteres mit Reserve auf die
berechneten 167 A. [BER]

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
| mit Ersatzpack ~36 kg | 129,0 kg | [BER] |
| **Zuladung mit Ersatzpack** | **151,0 kg** | [BER] |

**Schlussfolgerung:** Das Gewicht ist keine bindende Randbedingung. Bei ~110 kg
tatsächlicher Nutzung (Fahrer 90 kg, Kleidung, Gepäck) bleiben rund 40 kg
Reserve. Selbst ein 45-kg-Pack wäre zulässig.

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

**Lastpfad geklärt:** Der Akku steht mit seiner Unterseite auf dem Schachtboden
auf, er hängt nicht an Auflagen. [MESS] Für die Konstruktion heißt das: Die
Zellmasse wird über den Gehäuseboden nach unten abgetragen, die Zugstangen
verspannen den Stapel gegen diesen Boden, und die Bodenplatte muss die volle
Packmasse flächig einleiten — bei ~36 kg gegenüber 9,9 kg im Original das
Vierfache. Die Auflagefläche ist deshalb großzügig auszulegen und die
Aussparungen für die Bodenkontaktblöcke dürfen sie nicht unnötig schwächen.

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

### 7.2 Chemie: NMC, 14S

Belegt über das Ladegerät, siehe Abschnitt 3. LFP scheidet aus.

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

**Nebeneffekt Montage:** Der ~36 kg schwere Pack wird nicht als Ganzes in den
410 mm tiefen Schacht gehoben, sondern dort etagenweise aufgebaut: untere Hälfte
(~18 kg) einsetzen, obere aufsetzen, dann Zugstangen durchstecken und verspannen.
Dieselben Stangen verspannen im selben Zug den Zellstapel gegen Vibration.

### 7.4 Kapazitätsziel

**14 × 100 Ah = 5,18 kWh** statt der Parität von 4,33 kWh, also **+20 %
Reichweite** für rund 6 kg Mehrgewicht, das laut Abschnitt 5 verfügbar ist.
Rechnerische Reichweite: 5.180 Wh ÷ 54 Wh/km ≈ **96 km** real. [BER]

> **[REC] Zellformat.** Marktübliche prismatische NMC-Zelle dieser Klasse:
> 3,7 V / 100 Ah, ca. 173 × 126 × 45 mm, ca. 2,1 kg, Pulsstrom bis 300 A,
> Innenwiderstand ≤ 0,4 mΩ. **Nicht produktverbindlich.** Die konkrete Zelle und
> damit die Innenaufteilung ist noch nicht gewählt; mehrere Anordnungen
> (2 oder 3 Etagen) erfüllen die Passung.

---

## 8. Rollerseitige Integration

### 8.1 Der vordere Steckplatz ist nicht gleichwertig — kritisch

[HB 33]: *„Für die vollständige Aufladung des Backup-Akkus muss das Kraftpaket 2.0
mindestens 4 Stunden im **vorderen** Steckplatz unter der Sitzbank des Rollers
eingesteckt sein."*

Der Roller hat einen **fest im Steuergerät verbauten 12-V-Backup-Akku** [HB 33],
der Schlüsselerkennung sowie das Öffnen von Sitzbank und Topcase versorgt,
solange kein Traktionsakku steckt. Er wird über den vorderen Steckplatz
nachgeladen und muss spätestens alle 3 Wochen geladen werden [HB 33].

**Risiko:** Speist der Ersatzpack diesen Pfad nicht, entlädt sich der Backup-Akku.
Folge laut [HB 66]: Der Roller startet nicht mehr, und die Sitzbank — hinter der
der Akkuschacht liegt — lässt sich nur noch über das Notschloss im Handschuhfach
öffnen.

> **[OFFEN]** Speist der vordere Steckplatz den DC/DC-Wandler über eine eigene
> Leitung, oder liegen alle drei Steckplätze auf demselben Leistungsbus und die
> Ladefunktion hängt an der CAN-Kommunikation? Zu klären an der Verteilerplatine
> bzw. mit Raffler. Blockiert: die Verkabelungsplanung.

### 8.2 Ladegerät

Das Serien-Ladegerät liefert 59 V / 6 A = 354 W [HB 69]. Für den 5,18-kWh-Pack
ergäbe das **rund 15 Stunden** Ladezeit. [BER]

Empfehlung: Aftermarket-Ladegerät 58,8–59 V CC/CV. Bei 15 A rund 6 h, bei 20 A
rund 4,5 h. [BER]

### 8.3 Fehlercodes des Originalsystems

Zur Einordnung späterer Fehlerbilder [HB 67]: E114 Kurzschluss im Roller /
Softwareproblem im Motorcontroller · E131 Überspannung · E142 Akku leer ·
E155 Akku zu warm zum Laden (> 45 °C) · E166 Akku zu kalt · E2XX schwerer Fehler.
Diese Codes werden im **Display des Akkus** angezeigt, nicht im Roller — sie
entfallen mit dem Umbau.

---

## 9. Rechtlicher Rahmen

Kein Rechtsrat. Der 54 ignite fährt 100 km/h [HB 6] und ist damit ein Fahrzeug
der Klasse L3e, nicht ein Kleinkraftrad.

- Eingriffe in den Antriebsstrang berühren die Betriebserlaubnis. Bei
  unveränderter Spannungslage (14S wie Original) und unveränderter Motorleistung
  ist mit einer Prüforganisation zu klären, was konkret abnahmepflichtig wird.
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
| 3 | Speisepfad des 12-V-Backup-Akkus klären | Verkabelungsplanung | 8.1 |
| 4 | Raffler: Spannungsfenster, SoC-Abgriff, CAN-Einschleifposition, Terminierung | CAN-Integration | — |
| 5 | BMS wählen: 14S, 100 A Dauer, 180 A Spitze, Balancing | Elektrikplanung | 4 |
| 6 | Ladegerät 58,8–59 V CC/CV, 15–20 A | — | 8.2 |
| 7 | Zulassungsbescheinigung Teil I, Felder F.1 und G | Gewichtsnachweis | 1 |
| 8 | Prüforganisation zu Abnahmepflicht kontaktieren | Zulassung | 9 |
| 9 | Leistungsverkabelung, Hauptsicherung, Vorladewiderstand | Elektrikplanung | — |

---

## 11. Verworfene Optionen

Damit die Diskussion nicht im Kreis läuft.

| Option | Verworfen weil | Datum |
|---|---|---|
| Rundzellen 21700 (14S20P) | ~600 Punktschweißungen ohne Gegenwert, da Bauraum reichlich und Gewicht nicht bindend | 2026-08-20 |
| Original-Gehäuse wiederverwenden | Entscheidung Christoph | 2026-08-20 |
| Trennrippen wegfräsen | Nicht nötig, da Volumen reichlich; erhält Reversibilität und Führungsfunktion | 2026-08-20 |
| 30-kg-Gewichtsobergrenze | Unbegründet; 151 kg Zuladung bleiben auch mit 36-kg-Pack | 2026-08-20 |
| Erhalt des OEM-BMS | Es ist die Fehlerquelle: Flottenmanagement-BMS mit GPS/GSM, Backend nicht mehr verfügbar | vorab |

---

## 12. Quellen

1. **`Materials/Benutzerhandbuch_ignite_54i.pdf`** — Kumpan electric,
   Benutzerhandbuch 54 ignite, 75 Seiten, erstellt 2020-10-01. Primärquelle für
   alle [HB]-Angaben.
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
