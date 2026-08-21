# CAD — Zellblock 16

Parametrisches Modell. Alle Maße stehen ausschließlich in
`parameter.scad`; ändert sich eines, pflanzt es sich durch alle Teile
fort. **Nie Maße in die Geometriedateien schreiben.**

## Dateien

| Datei | Inhalt |
|---|---|
| `parameter.scad` | sämtliche Maße, abgeleitete Größen, Plausibilitätsprüfungen |
| `kontur.scad` | Außen- und Innenkontur, Zellraster |
| `testring.scad` | Musterstück T-01 für den Passungstest |
| `gehaeuse.scad` | die beiden Gehäusesegmente |

## Bauen

```sh
openscad -o testring.stl --export-format binstl testring.scad
```

Die Echo-Ausgabe listet die abgeleiteten Maße. Die `assert`-Prüfungen in
`parameter.scad` brechen ab, wenn eine Maßänderung die Konstruktion
unmöglich macht — etwa wenn das Spiel in der Breite unter die doppelte
Drucktoleranz fällt oder die Stirnwand die Zwickelnut nicht mehr trägt.

## Zur Außenkontur

Sie ist die **Vereinigungsmenge dreier Originalfach-Grundrisse**, nicht
ein Quader mit angesetzten Nuten. Wo zwei Fächer aneinanderstoßen,
treffen an Vorder- und Rückkante zwei Viertelrundungen aufeinander;
dazwischen bleibt eine linsenförmige Einbuchtung von 2 × 5 mm Breite und
5 mm Tiefe stehen. Das ist die Zwickelnut, in die die Führungsrippe des
Schachts greift. **Sie entsteht von selbst — sie wird nicht
konstruiert.** Damit passt die Kontur per Konstruktion, und am Fahrzeug
muss nichts gefräst werden.

## Testring T-01

Vor der Vollausführung verbindlich. Er prüft in einem Zug:

1. **Passung der Außenkontur** in den Akkuschacht
2. **Eingriff der Führungsrippen** in die vier Zwickelnuten
3. **Innenmaß** gegen zwei echte Zellen — die beiden 2 mm hohen Stege
   innen markieren den Sollplatz des Zellblocks

Dazu Höhenmarken alle 10 mm an der linken Außenwand: Klemmt der Ring,
lässt sich daran ablesen, wie tief er kam.

| | |
|---|---|
| Material | **PETG genügt** — der Ring wird nicht heiß und trägt nichts. ASA erst beim Vollteil. |
| Volumen | ~210 cm³, also rund 225 g |
| Druckzeit | **4–6 h** mit 0,4 mm Düse, 3–4 h mit 0,6 mm |
| Orientierung | stehend, Unterseite auf der Platte |

Die Unterseite bleibt bewusst plan: Nur so lässt sich mit einer
Fühlerlehre feststellen, ob der Ring wirklich auf dem Schachtboden
aufsitzt und nicht irgendwo hängt.

**Warum der Aufwand:** In der Breite bleiben 1,7 mm Spiel je Seite bei
einer erwarteten Drucktoleranz von ±0,4 mm. Ein Fehldruck des Vollteils
kostet 3 kg Material und über 30 Stunden.

## Gehäusesegmente

```sh
openscad -D 'teil="unten"' -o segment_unten.stl --export-format binstl gehaeuse.scad
openscad -D 'teil="oben"'  -o segment_oben.stl  --export-format binstl gehaeuse.scad
```

| | Unterteil | Oberteil |
|---|---:|---:|
| Eingebaute Höhe | 213,5 mm | 207,5 mm |
| Druckhöhe | 221,5 mm¹ | 207,5 mm |
| Material | 1,53 kg | 1,17 kg |
| Durchbrüche | 3 Kabel, 8 Schrauben | 18 Lüftung, 8 Schrauben |

¹ inklusive der überstehenden Zentrierzapfen. Beide liegen unter der
Bauhöhe des H2S von 340 mm; ein `assert` prüft das.

**Zusammen 2,7 kg**, dazu kommen Zwischenplatte und Deckel.

### Wie die Segmente zusammenhalten

**Nicht miteinander** — jedes wird für sich an die **durchgehende hintere
Aluplatte** geschraubt, die mit 400 mm Höhe über die Trennfuge reicht.
Vier Schrauben je Segment durch die 8 mm starke Rückwand in Gewinde im
Aluminium. Die sechs Zentrierzapfen sorgen nur für Flucht beim
Zusammensetzen, sie tragen nichts.

Das ist derselbe Grundsatz wie beim Rest der Konstruktion: Metall trägt,
Kunststoff hüllt.

### Warum es keine Führungsnuten für die Endplatten gibt

Zwischen Seitenwand und Zellblock bleiben nur **2,2 mm**. Eine Nut oder
Führungsrippe bräuchte mehr, und die Seitenwand ist mit 2,5 mm ohnehin am
Limit. Gebraucht werden sie auch nicht: Die hintere Platte liegt flach an
der Rückwand an und ist damit von selbst positioniert; die vordere steht
beim Einbau auf zwei Nasen im Boden und wird anschließend von den
Zugstangen gehalten.

### Warum der Boden nicht verrippt ist

Er liegt vollflächig auf dem Schachtboden auf und kann sich deshalb gar
nicht durchbiegen — er muss die Last nur durchleiten, nicht auf Biegung
aufnehmen. Rippen würden hier bloß die Zellen anheben, statt sie auf dem
Boden stehen zu lassen. Die drei Kabeldurchführungen liegen im hinteren
Bereich beim BMS, wo keine Zellmasse darauf steht.

### Lüftung

216 mm² in den Stirnwänden des Kopfraums. Das ist wenig, aber der
Kopfraum misst nur 12 mm, und thermisch ist es unkritisch: 24 W
Verlustleistung ergeben rund 9 K Übertemperatur, abgeführt über die
Gehäuseoberfläche. Die Schlitze sind vor allem ein Zugeständnis an die
Datenblattwarnung, die Zellen nicht einzukapseln. Die Hauptöffnung trägt
später der Deckel.

## Rückmeldung nach dem Test

Passt der Ring, geht es an die Gehäusesegmente. Klemmt er, bitte melden
**wo** — an den Seitenwänden, an den Zwickeln oder an den Ecken. Danach
wird in `parameter.scad` genau eine Zahl geändert.
