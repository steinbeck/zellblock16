# Konstruktionsspezifikation: Ersatzakku Kumpan 54 ignite

**Stand:** 2026-08-21
**Status:** Design abgenommen. Grundlage für den Implementierungsplan.
**Faktenbasis:** `grundlagen.md` — dort stehen Herkunft und Belegqualität aller
Eingangsgrößen. Dieses Dokument leitet daraus die Konstruktion ab.

> **Sicherheitshinweis.** 58,4 V DC, Kurzschlussströme im Kiloampere-Bereich,
> 43 kg bewegte Masse. Isoliertes Werkzeug, während der Montage stets einen Pol
> getrennt halten, Zellen gegen Rahmen isolieren. Der Umbau berührt
> Betriebserlaubnis und Versicherungsschutz.

---

## 1. Kenndaten

| | |
|---|---|
| Konfiguration | **16S1P LFP** |
| Zelle | EVE LF105, 105 Ah, 3,2 V, prismatisch |
| Nennspannung | 51,2 V |
| Ladeschluss | **58,4 V** (16 × 3,65 V) |
| Entladeschluss BMS | 44,8 V (16 × 2,8 V) |
| Energie | **5,38 kWh** (+24 % gegenüber Parität von 4,33 kWh) |
| Dauerstrom Auslegung | 100 A |
| Spitzenstrom Auslegung | **180 A** |
| Rechnerische Reichweite | ~96 km real |
| Gesamtmasse | **~43 kg** |
| Außenmaß | 270 × 215 × 430 mm |
| Verbleibende Zuladung | 144 kg |

**Harte Obergrenze:** Der Motorcontroller verträgt maximal **60 V**
(Auskunft Raffler, `grundlagen.md` §3.2). Der Ladeschluss von 58,4 V lässt
1,6 V Reserve. Das Serien-Ladegerät mit 59 V darf **nicht** verwendet werden.

---

## 2. Zelle

| Parameter | Wert | Quelle |
|---|---|---|
| Höhe über Pole (H1) | 200,50 ± 0,50 mm | Datenblatt |
| Höhe Gehäuse (H2) | 195,50 ± 0,50 mm | Datenblatt |
| Länge (L) | 130,30 ± 0,50 mm | Datenblatt |
| Dicke (T) | 36,35 ± 0,50 mm | Datenblatt, **unter 300 kgf bei 30–40 % SOC** |
| Polabstand | 67 ± 1 mm | Datenblatt |
| Pole | M6 Innengewinde | Händler |
| Masse | 1980 ± 60 g | Datenblatt |
| Innenwiderstand | < 0,35 mΩ | Datenblatt |
| Dauerstrom | 1C = 105 A | Datenblatt |
| Zyklen | > 6.000 | Datenblatt |

**Zur Dicke:** Die 36,35 mm gelten nur unter Verspannung bei mittlerem
Ladezustand. Ungespannt und voll geladen ist die Zelle dicker. Alle
Tiefenmaße dieser Konstruktion setzen die Verspannung nach §4 voraus.

**Strangwiderstand:** 16 × 0,35 mΩ = **5,6 mΩ**.
Spannungseinbruch bei 180 A: **1,0 V**, also 2,0 %. [BER]

---

## 3. Anordnung

### 3.1 Warum sie erzwungen ist

16 Zellen à 200,5 mm Höhe benötigen 75.800 mm² Grundfläche; verfügbar sind
58.050 mm². Also **zwei Etagen à acht Zellen**. Für acht Zellen auf
270 × 215 mm existiert genau eine tragfähige Anordnung: zwei Stapel zu je vier,
nebeneinander.

Alle liegenden Varianten scheiden aus — sicherheitstechnisch (das Berstventil
arbeitet nur bei Polen oben) und geometrisch. Herleitung in `grundlagen.md` §3.3.

### 3.2 Layout einer Etage

```
        ←──────────── 270 mm ────────────→
      ┌──────────────────────────────────┐   ↑
      │╔════════════════════════════════╗│   │  Aluplatte hinten
      │║ ┌─────────────┬─────────────┐  ║│   │
      │║ │  Zelle A1   │  Zelle B1   │  ║│   │
      │║ ├─────────────┼─────────────┤  ║│   │  Zellblock
      │║ │  Zelle A2   │  Zelle B2   │  ║│   │  145,4 mm tief
      │║ ├─────────────┼─────────────┤  ║│   │
      │║ │  Zelle A3   │  Zelle B3   │  ║│   │  215 mm
      │║ ├─────────────┼─────────────┤  ║│   │
      │║ │  Zelle A4   │  Zelle B4   │  ║│   │
      │║ └─────────────┴─────────────┘  ║│   │
      │╚════════════════════════════════╝│   │  Aluplatte vorn
      │  ░░░ BMS, Verkabelung, ~45 mm ░░ │   │
      └──────────────────────────────────┘   ↓
           260,6 mm belegt von 270 mm
```

Die Zellen quellen in **Dickenrichtung** auf, hier also nach hinten. Deshalb
stapeln sie in die Tiefe, wo Raum für Endplatten und Ausdehnung ist. In der
Breite stoßen sie mit den Schmalseiten aneinander; dort findet keine Ausdehnung
statt.

### 3.3 Verschaltung

16S1P: alle Zellen in Reihe. Verbindung über Busbars auf den M6-Polen.
Serpentinenführung innerhalb jeder Etage, Etagenübergang über ein isoliertes
Kabel durch die Zwischenplatte. 17 Balancerabgriffe zum BMS.

**Anzugsmoment M6-Pole: 4–6 Nm.** Nicht überziehen — die Gewinde sitzen im
Aluminium des Zelldeckels.

---

## 4. Tragendes Skelett

### 4.1 Prinzip

**Metall trägt, Kunststoff hüllt.** Zwei durchgehende Aluminiumplatten über die
volle Bauhöhe, verbunden durch waagerechte Gewindestangen. Das gedruckte
Gehäuse überträgt keine Kräfte.

```
Seitenansicht                Aluplatte 260 × 400 × 8 mm
      ┌─────────────────────────────────────────┐
      │ ▉                                     ▉ │
      │ ▉ ══════ M8 ══════ Zellen Etage 2 ═══ ▉ │
      │ ▉ ══════ M8 ══════                ═══ ▉ │
      │ ▉ ─────────── Zwischenplatte ───────── ▉ │
      │ ▉ ══════ M8 ══════ Zellen Etage 1 ═══ ▉ │
      │ ▉ ══════ M8 ══════                ═══ ▉ │
      │ ▉                                     ▉ │
      └─────────────────────────────────────────┘
         Gehäuse = Hülle, Führung, Isolierung
```

**Warum keine senkrechten Eckstangen:** Die Zellen belegen 260,6 mm der 270 mm
Breite. Nach Abzug der Wände bleiben je Seite unter 2 mm — für eine M8-Stange
werden ringsum etwa 15 mm gebraucht. Es gibt schlicht keine Ecke dafür, und
keine andere Zellanordnung schafft welche.

### 4.2 Verspannungskräfte

| Größe | Wert | Quelle |
|---|---|---|
| Vorspannung je Zellstapel | 3–5 kN | Datenblatt §6.2 |
| **Je Endplattenpaar (2 Stapel)** | **6–10 kN** | [BER] |
| Maximal ertragbar | 7 kN je Stapel | Datenblatt |
| Innere Schäden ab | 9 kN je Stapel | Datenblatt |
| **Ausdehnungskraft am Lebensende** | **bis 30 kN** | Datenblatt §6.3 |

**Zugstangen:** 4 Stück M8 A2-70 je Etage, insgesamt 8.

| | |
|---|---|
| Last je Stange | 1,5–2,5 kN |
| Bruchlast M8 A2-70 | ~25 kN |
| **Sicherheit** | **~10-fach** |
| Anzugsmoment für 2 kN | **3–4 Nm** |

Die Stangen sind unkritisch. **Kritisch sind die Endplatten:** Sie müssen
6–10 kN über 260 × 195 mm verteilen, ohne sich in der Mitte durchzubiegen.
Daher **8 mm Aluminium**; Stahl wäre steifer, wöge aber das Dreifache.

**Nachgiebige Zwischenlagen:** Zwischen die Zellen kommen Schaumlagen (EPDM
oder PU, 2–3 mm, ca. 30 % kompressibel), damit die Alterungsausdehnung nicht
gegen eine starre Einspannung läuft und die 30-kN-Grenze ansteuert.

### 4.3 Masse des Skeletts

| Teil | kg |
|---|---|
| 2 Aluplatten 260 × 400 × 8 mm | 4,5 |
| 8 Zugstangen M8, Muttern, Scheiben | 1,5 |
| **Summe** | **6,0** |

---

## 5. Gehäuse

### 5.1 Außenkontur

**Vereinigungsmenge dreier Kraftpaket-Grundrisse:** ein Körper von
270 × 215 × 430 mm mit vier abgerundeten Außenkanten (**r = 5 mm**) und vier
eingeformten Zwickelnuten an den ehemaligen Trennebenen (bei x = 90 und
x = 180 mm, je vorn und hinten).

Die Nuten nehmen die Führungsrippen des Schachts auf. Die Kontur passt per
Konstruktion, weil sie exakt der Hüllform der drei Originalakkus entspricht.
Volumenverlust durch die Rundungen: ~26 ml, also 0,11 %.

**Am Fahrzeug wird nichts gefräst.** Die Rippen bleiben und übernehmen weiterhin
die Seitenführung.

### 5.2 Wandaufbau

| Fläche | Stärke | Begründung |
|---|---|---|
| Seitenwände (links/rechts) | **2,5 mm** | Breite ist der Engpass, siehe §8 |
| Vorder- und Rückwand | 5,0 mm | dort 45 mm Freiraum, trägt Verrippung |
| Bodenplatte | 6,0 mm | verrippt, leitet 43 kg flächig ein |
| Zwischenplatte | 12,0 mm | mit Taschen für Pole und Busbars |
| Deckel | 4,0 mm | mit Entlüftungsöffnungen |

### 5.3 Material

**ASA.** Glasübergang ~105 °C gegenüber 80 °C bei PETG, das unter Last bereits
ab 60 °C kriecht. Der Akkuschacht erreicht im Sommer deutlich über 50 °C. Da das
Gehäuse dank des Skeletts keine Kräfte trägt, wäre PETG tolerierbar — der
Aufpreis für ASA ist jedoch gering gegenüber dem Risiko eines Verzugs.

Der BambuLab H2S druckt ASA mit seiner beheizten Kammer prozesssicher.

Bedarf: **3–3,5 kg**, grob 30–50 h Druckzeit.

### 5.4 Segmentierung

Bauraum H2S: 340 × 320 × 340 mm. Ein 430 mm hohes Gehäuse ist nicht am Stück
druckbar.

**Zwei Segmente à 215 mm**, stehend gedruckt mit offener Seite nach oben.
Fügung über **Stufenfalz mit 10 mm Überlappung**, seitlich an die Aluplatten
geschraubt. Die Naht überträgt keine Kräfte — sie muss nur formschlüssig sitzen
und gegen Spritzwasser dicht sein.

### 5.5 Aufnahme des Skeletts

Beide Segmente tragen innen **vertikale Nuten**, in die die Aluplatten von oben
eingeschoben werden. Das fixiert sie während der Montage im Schacht, bevor die
Zellen eingesetzt sind.

---

## 6. Lastpfad

Der Pack steht mit seiner Unterseite auf dem Schachtboden auf. Die drei
Original-Steckkontakte werden **ausgebaut** (`grundlagen.md` §6), wodurch der
Boden plan wird.

| | Original (3 Packs) | Ersatzpack |
|---|---|---|
| Masse | 29,7 kg | 43 kg |
| Auflagefläche | 58.050 mm² | 58.050 mm² |
| Flächenpressung | 0,0050 N/mm² | **0,0073 N/mm²** |
| | | **+45 %** |

Weil die Last auf alle drei Fachflächen verteilt wird, steigt die Pressung nur
um 45 %, nicht um das Vierfache. Dasselbe Verhältnis gilt für Stoßlasten.

**Bedingung:** Die Bodenplatte muss eben aufliegen und darf sich nicht
durchbiegen, sonst konzentriert sich die Last mittig. Daher 6 mm Stärke mit
Kreuzverrippung auf der Oberseite.

Die freiwerdenden Kontaktöffnungen dienen als **Kabeldurchführung** nach unten.

---

## 7. Thermik

| Lastfall | Verlustleistung |
|---|---|
| Fahrprofil Christoph, 65 A | **24 W** |
| 100 A Dauer | 56 W |
| 180 A Spitze | 181 W, sekundenweise |
| Laden mit 20 A | 2 W |

Bei 24 W erwärmen sich 31,7 kg Zellmasse um **2,6 K/h**. Über die
Gehäuseoberfläche von 0,53 m² stellt sich eine Übertemperatur von etwa **9 K**
ein. Bei 30 °C Umgebung also ~39 °C Zelltemperatur, deutlich unter der
65-°C-Grenze des Datenblatts.

**Passive Kühlung genügt. Keine Lüfter.**

Konstruktive Folgen:
- Die Zellen leiten Wärme in ihrer Ebene mit 18–24 W/(m·K), **durch die Dicke
  aber nur mit 1–2 W/(m·K)**. Wärme muss über Pole und Zellböden abgeführt
  werden, nicht über die großen Flächen.
- Deckel mit Entlüftungsöffnungen, Luftspalt zum Schacht.
- Das Datenblatt warnt: *„Do not use plastic to encapsulate batteries."* Nicht
  vergießen, Luftraum belassen.
- Das reale Risiko ist nicht die Eigenerwärmung, sondern Sommerhitze im Schacht.

---

## 8. Maßbilanzen

### 8.1 Höhe — 5 mm Reserve

| | mm | kumuliert |
|---|---|---|
| Bodenplatte | 6,0 | 6,0 |
| Zellkörper Etage 1 (H2) | 195,5 | 201,5 |
| Zwischenplatte mit Polaufnahme | 12,0 | 213,5 |
| Zellkörper Etage 2 (H2) | 195,5 | 409,0 |
| Verschaltungsraum oben | 12,0 | 421,0 |
| Deckel | 4,0 | **425,0** |
| **Reserve auf 430 mm** | | **5,0** |

**Der entscheidende Kunstgriff:** Die Zwischenplatte sitzt auf den Zellgehäusen
(195,5 mm) auf und nimmt die 5 mm überstehenden Pole samt Busbars und Muttern in
**Taschen** auf. Rechnete man die Busbars naiv obendrauf, käme man auf 436 mm
und die Konstruktion wäre gescheitert.

### 8.2 Breite — der Engpass

| | mm |
|---|---|
| Bauraum außen | 270,0 |
| Zellen, 2 × 130,30 | 260,6 |
| Zelltoleranz ungünstig, 2 × 0,5 | +1,0 |
| **verbleibt für zwei Wände und Spiel** | **8,4** |
| davon Wände 2 × 2,5 | 5,0 |
| **Spiel je Seite** | **1,7** |

Die Drucktoleranz des H2S liegt über 270 mm bei etwa ±0,4 mm. Es geht auf, aber
ohne Reserve. **Deshalb ist der Testdruck nach §11.1 verbindlich.**

### 8.3 Tiefe — komfortabel

| | mm |
|---|---|
| Bauraum außen | 215,0 |
| Wände 2 × 5,0 | 10,0 |
| Zellblock 4 × 36,35 | 145,4 |
| Aluplatten 2 × 8,0 | 16,0 |
| **frei für BMS und Verkabelung** | **43,6** |

### 8.4 Masse

| Posten | kg |
|---|---|
| 16 Zellen | 31,7 |
| Aluplatten | 4,5 |
| Zugstangen und Kleineisen | 1,5 |
| Gehäuse ASA | 3,5 |
| BMS, Busbars, Kabel, Isolation | 2,0 |
| **Summe** | **43,2** |

---

## 9. Elektrik

### 9.1 BMS

| Anforderung | Wert |
|---|---|
| Konfiguration | 16S LFP |
| Dauerstrom | ≥ 150 A |
| Kurzzeit | ≥ 250 A |
| Balancing | aktiv bevorzugt |
| Schnittstelle | Bluetooth, für Ladestandsanzeige am Handy |
| Ladeschluss | 3,65 V/Zelle |
| Entladeschluss | 2,8 V/Zelle |
| Temperaturabschaltung | 60 °C |
| Ladesperre unter 0 °C | zwingend |

**Vorteil dieser Konfiguration:** 16S-LFP-BMS sind Massenware aus dem
Solarspeicherbau — große Auswahl, niedrige Preise, gute Dokumentation.

Das BMS darf im Normalbetrieb nicht begrenzen: 150 A Dauer liegen über der
Zellgrenze von 105 A, sodass das BMS schützt statt zu drosseln.

### 9.2 Leistungspfad

| Bauteil | Auslegung |
|---|---|
| Anschluss an den Roller | **Leitungen aller drei Ports zusammenführen** |
| Strombelastbarkeit | 100 A je Port, 300 A zusammen |
| Hauptsicherung | 200 A ANL/Mega, träge |
| Trennschalter | manuell, für Wartung |
| Vorladewiderstand | gegen Einschaltlichtbogen am Controller-Kondensator |
| Kabeldurchführung | durch die freiwerdenden Kontaktöffnungen |

**Alle drei Portleitungen parallel** (`grundlagen.md` §8.1). Ein Port trägt 100 A
und damit unseren Spitzenstrom von 180 A nicht. Zugleich ist es die praktischere
Lösung: 180 A über eine einzelne Leitung erforderten 35–50 mm², die sich im
Fahrzeug kaum verlegen lassen.

**Datenpin-Schleife schließen — zwingend.** Der Roller prüft über die Datenpins
der Ports, ob ein Stromkreis geschlossen ist, und gibt sonst nicht frei; das gilt
unabhängig vom CAN-Modul. Beim Ausbau der Buchsenbox sind die beiden dort
liegenden Leitungen dauerhaft zu brücken. Wird das übersehen, bleibt der Roller
ohne erkennbaren Grund tot.

Der fahrzeugseitige Sicherungskasten liegt hinter den Ports und bleibt im
Leistungspfad. Vor Inbetriebnahme prüfen, ob seine Absicherung zu 180 A passt.

**Vorladung ist nicht optional:** Der Controller enthält Kondensatoren, die beim
Zuschalten einen Stromstoß von mehreren hundert Ampere ziehen. Ohne
Vorladewiderstand verschweißen Schalterkontakte und es entsteht ein Lichtbogen.

### 9.3 Laden

| | |
|---|---|
| Ladeschluss | **58,4 V** (16 × 3,65 V) |
| Strom | 15–20 A |
| Ladezeit | ~4,5–6 h |
| Kennlinie | CC/CV |

Das Serien-Ladegerät (59 V, 6 A) ist **ungeeignet**: zu hohe Spannung für LFP
und mit 15 h Ladezeit unbrauchbar.

### 9.4 CAN-Integration

Raffis Modul wird nach JJac-Muster in den CAN-Bus eingeschleift und ersetzt das
OEM-BMS. Das Modul **interagiert nicht mit dem Akku** — es täuscht dessen
Anwesenheit vor. Der Roller braucht vom Pack nur Plus und Minus.

**Folge:** Keine echte Ladestandsanzeige im Roller. Der SoC kommt aus der
BMS-App.

---

## 10. Montagereihenfolge

Der Pack wird **im Schacht aufgebaut**, nicht davor — 43 kg lassen sich nicht als
Block in einen 430 mm tiefen Schacht heben. Jede Einzelkomponente bleibt unter
16 kg, die Zellen wiegen einzeln 2 kg.

1. Original-Steckkontakte ausbauen, Öffnungen als Kabeldurchführung herrichten.
   **Dabei die Datenpin-Leitungen in der Buchsenbox brücken** und die Leitungen
   aller drei Ports zum künftigen Anschlusspunkt zusammenführen
2. Gehäuse-Unterteil einsetzen, Sitz und Rippeneingriff prüfen
3. Bodenplatte einlegen
4. Beide Aluplatten in die Führungsnuten einschieben
5. Zellen Etage 1 einsetzen, Schaumlagen dazwischen
6. Untere Zugstangen einführen, **über Kreuz auf 3–4 Nm anziehen**
7. Zwischenplatte auflegen, Busbars der Etage 1 in die Taschen legen
8. Zellen Etage 2 einsetzen
9. Obere Zugstangen, ebenfalls über Kreuz verspannen
10. Gehäuse-Oberteil aufsetzen, Stufenfalz, an die Aluplatten schrauben
11. Busbars der Etage 2, Balancerkabel, BMS montieren
12. Leistungskabel, Sicherung, Trennschalter, Vorladung
13. Deckel

**Während der gesamten Montage bleibt ein Pol getrennt.**

---

## 11. Verifikation vor der Vollausführung

### 11.1 Testdruck Breitenmuster — verbindlich

Ein 40 mm hoher Ring der echten Außenkontur, etwa 1 h Druckzeit. Prüft in einem
Zug:

- Passung in den Schacht
- Eingriff der Führungsrippen in die Zwickelnuten
- Innenmaß gegen zwei echte Zellen nebeneinander

Erst nach bestandenem Test wird das Vollteil gedruckt. Bei 1,7 mm Spiel je Seite
und ±0,4 mm Drucktoleranz ist dieser Schritt nicht verhandelbar.

### 11.2 Zellprüfung

Alle 16 Zellen vor dem Einbau auf Kapazität und Ruhespannung prüfen. Bei 16
Zellen in Reihe **ohne Parallelschaltung bestimmt die schwächste Zelle die
Packkapazität** — es gibt keinen Ausgleich.

### 11.3 Trockenaufbau

Etage 1 außerhalb des Fahrzeugs aufbauen und verspannen, um Verspannkraft und
Maßhaltigkeit zu prüfen, bevor im Schacht gearbeitet wird.

---

## 12. Offene Punkte

| # | Punkt | Blockiert | Verantwortlich |
|---|---|---|---|
| 1 | Absicherung im fahrzeugseitigen Sicherungskasten gegen 180 A prüfen | Inbetriebnahme | — |
| 2 | Zellbestellung — Preis mit 19 % USt, nicht der Nullsteuersatz für PV | Beschaffung | Christoph |
| 3 | BMS-Auswahl nach §9.1 | Beschaffung | — |
| 4 | Ladegerät 58,4 V CC/CV, 15–20 A | Beschaffung | — |
| 5 | Prüforganisation zur Abnahmepflicht | Zulassung | Christoph |
| 6 | Zulassungsbescheinigung Teil I, Felder F.1 und G | Gewichtsnachweis | Christoph |
| 7 | Rippenquerschnitt für die Zwickelnuten | Detailmaß Gehäuse | Testdruck §11.1 |

---

## 13. Nächster Schritt

Parametrisches OpenSCAD-Modell. Alle Maße dieser Spezifikation werden als
Variablen geführt, sodass eine Korrektur — etwa nach dem Testdruck — sich durch
das gesamte Modell fortpflanzt.

Reihenfolge: Außenkontur und Testring, dann Gehäusesegmente, dann Bodenplatte,
Zwischenplatte und Deckel.
