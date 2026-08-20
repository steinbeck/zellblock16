# Grobe Kostenabschätzung

**Stand:** 2026-08-20
**Genauigkeit:** ±30–40 %. Zellpreise schwanken stark und sind der mit Abstand
größte Posten. Vor Bestellung neu erheben.
**Grundlage:** `grundlagen.md` — 14S NMC, 14 × 100 Ah, 5,18 kWh.

---

## Zwei Vorbemerkungen, die alles Weitere prägen

**1. Prismatische NMC-Zellen sind im europäischen DIY-Handel praktisch nicht
erhältlich.** Der hiesige Markt ist auf LFP ausgerichtet, weil er vom
Solarspeicherbau getragen wird. Stichprobe LionTec (deutscher Spezialhändler für
prismatische Zellen): ausschließlich LFP im Sortiment, kein NMC. [REC]
NMC prismatisch bekommt man realistisch nur über Direktimport aus China oder als
Fahrzeug-Rückläufer. Das ist ein **Beschaffungsrisiko, kein Preisproblem** — und
es ist der Grund, warum unten drei Szenarien stehen statt einer Zahl.

**2. Der europäische Kleinhandel ist teuer.** Aus den LionTec-Preisen gerechnet:
100 Ah LFP für 209 € entspricht **653 €/kWh**; die günstigste Zelle im Sortiment
(400 Ah) liegt bei 311 €/kWh. [BER] Zum Vergleich: ab Werk in China kosten
Zellen dieser Klasse 90–130 €/kWh. Die Spanne zwischen bequem und billig beträgt
hier den Faktor drei bis fünf.

---

## Zellen — drei Beschaffungswege

### A · EU-Händler, Neuware

| | |
|---|---|
| Zellpreis | 250–350 €/kWh |
| **5,18 kWh** | **1.300–1.800 €** |
| Lieferzeit | Tage |
| Risiko | gering — Gewährleistung, Rückgaberecht |
| Haken | **NMC prismatisch kaum im Angebot**; ggf. Sonderbestellung nötig |

### B · Direktimport China (Alibaba o. ä.), Grade A

| | |
|---|---|
| Zellen ab Werk, 90–130 €/kWh | 465–675 € |
| Gefahrgutversand (UN 3480), ~35 kg | 250–450 € |
| Einfuhrumsatzsteuer 19 % auf Ware + Fracht | 135–215 € |
| Zoll ~2,7 % | 15–30 € |
| **Summe** | **865–1.370 €** |
| Lieferzeit | 4–10 Wochen |
| Risiko | **hoch** — Grade B als Grade A deklariert, keine praktisch durchsetzbare Gewährleistung, Kapazität und Innenwiderstand ungeprüft |

### C · Fahrzeug-Rückläufer / Second Life

| | |
|---|---|
| 50–100 €/kWh | **260–520 €** |
| Lieferzeit | Glückssache |
| Risiko | **hoch** — Restkapazität 70–90 %, ungleiche Alterung, Historie unbekannt, oft nur als ganzes Modul statt Einzelzellen |

Zur Einordnung: Der Referenzumbau JJac nennt 250–400 € für seinen 60-Ah-Zellsatz
aus Rückläufern. [Forum, unbelegt] Das passt zu dieser Spanne.

> **Zwei Punkte zu C.** Erstens: Bei ungleich gealterten Zellen bestimmt die
> schwächste die Packkapazität — bei 14 in Reihe ohne Parallelschaltung gibt es
> keinen Ausgleich. Zweitens: Vor dem Einbau müsste jede Zelle einzeln kapazitäts-
> und innenwiderstandsgeprüft werden, sonst kauft man ein Ärgernis. Das kostet
> Zeit und ein Testgerät, spart aber im Zweifel 1.000 €.

---

## Feste Posten, unabhängig vom Zellweg

| Posten | Spanne | Anmerkung |
|---|---|---|
| **BMS** 14S, 200 A, Bluetooth (JK / JBD / Daly) | 150–280 € | 200 A gegen 180 A Auslegungsspitze; aktiver Balancer bevorzugt |
| **Ladegerät** 58,8 V CC/CV, 15–20 A | 150–250 € | Serienteil hat nur 6 A → 15 h Ladezeit |
| **Filament**, 4–5 kg ASA oder PETG | 100–150 € | Gehäusewände allein ~2 L Materialvolumen, dazu Zellhalter |
| **Leistungskabel** 25–35 mm², Kabelschuhe, Crimpen | 80–120 € | kurze Wege, Crimpzange ggf. leihen |
| **Vorladewiderstand + Trennschalter/Schütz** | 40–100 € | gegen Einschaltlichtbogen am Controller-Kondensator |
| **Zellverbinder/Busbars + Schrauben** | 30–60 € | bei prismatischen Zellen oft beiliegend |
| **Gewindestangen** M8 A2, 6 × ~450 mm, Muttern, Scheiben | 30–50 € | tragende Verspannung beider Gehäusesegmente |
| **Isolation** Fischpapier, Kapton, Schrumpfschlauch, Schaum | 30–60 € | Zellen gegen Rahmen und untereinander |
| **Hauptsicherung** ANL/Mega 200 A + Halter | 20–35 € | träge |
| **Balancerkabel, Stecker, Kleinteile** | 20–40 € | |
| **Summe** | **650–1.145 €** | |

---

## Gesamtsummen

| Weg | Zellen | Fixposten | **Gesamt** |
|---|---|---|---|
| **A** EU-Neuware | 1.300–1.800 € | 650–1.145 € | **1.950–2.950 €** |
| **B** China-Direktimport | 865–1.370 € | 650–1.145 € | **1.500–2.500 €** |
| **C** Rückläufer | 260–520 € | 650–1.145 € | **900–1.650 €** |

**Bemerkenswert:** In Weg C kosten die Zellen weniger als das Drumherum. Ab dort
lohnt kein weiteres Sparen am Zellsatz — es lohnt Sorgfalt bei seiner Auswahl.

---

## Nicht enthalten

| Posten | Grobwert | Anmerkung |
|---|---|---|
| Prüforganisation / Abnahme | 200–600 € | offener Punkt 8, Umfang noch ungeklärt |
| Raffis CAN-Modul | 0–150 € | laut Vorgespräch bereits vorhanden — bitte bestätigen |
| Werkzeug (Crimpzange, Drehmomentschlüssel, Zelltester) | 100–300 € | einmalig, teils leihbar |
| Fehlversuche beim Druck | 20–50 € | erfahrungsgemäß mindestens ein Fehldruck |

---

## Einordnung

Drei neue Kraftpakete 2.0 lagen bei etwa 700 € pro Stück, also **~2.100 €** — und
sind wegen der Kumpan-Insolvenz nicht mehr regulär erhältlich. Der Eigenbau
liefert in jedem der drei Wege **~20 % mehr Kapazität**, in Weg B und C zudem
für weniger Geld, und macht vor allem unabhängig von einem Ersatzteilmarkt, den
es nicht mehr gibt.

Der eigentliche Gewinn ist aber nicht der Preis, sondern dass ein defekter
Ersatzpack künftig durch Nachkauf einzelner Zellen instandsetzbar bleibt.

---

## Was diese Schätzung noch nicht kann

Der größte Posten — die Zellen — steht auf einem **[REC]**-Formatfund
(173 × 126 × 45 mm, 2,1 kg, ~100 Ah), nicht auf einem konkreten Angebot. Solange
kein realer Lieferant mit Datenblatt und Preis feststeht, ist alles oben eine
Größenordnung, keine Kalkulation. Die Zellsuche ist damit der nächste
wertschöpfende Schritt — sie klärt gleichzeitig Preis, Verfügbarkeit **und** die
exakten Maße, an denen die gesamte Innenaufteilung hängt.
