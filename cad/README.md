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

## Rückmeldung nach dem Test

Passt der Ring, geht es an die Gehäusesegmente. Klemmt er, bitte melden
**wo** — an den Seitenwänden, an den Zwickeln oder an den Ecken. Danach
wird in `parameter.scad` genau eine Zahl geändert.
