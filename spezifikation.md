> # ⚠️ VERALTET — NICHT ALS DATENQUELLE VERWENDEN
>
> **Ersetzt durch [`grundlagen.md`](grundlagen.md) am 2026-08-20.**
>
> Dieses Dokument entstand vor Auswertung des Benutzerhandbuchs und enthält
> nachweislich falsche Werte:
>
> | Abschnitt | Falsch | Richtig ([`grundlagen.md`](grundlagen.md)) |
> |---|---|---|
> | 2, 4 | Kapazität 1.480 Wh/Pack, Parität 4,44 kWh | 1.442 Wh/Pack, Parität **4,33 kWh** |
> | 4 | Nennspannung 51,8 V | **50,6 V** |
> | 4 | Spitzenstrom 150–240 A | **~167 A** (aus 7.000 W belegt) |
> | 4 | Maximalgewicht ≤ 30 kg | unbegründet; **151 kg Zuladung** bleiben |
> | 4 | LFP-Abwägung offen gelassen | ausgeschlossen (Ladegerät 59 V) |
> | 6 | Bauraum 210 × 90 × 340 mm, 19,3 L | **90 × 215 × 410 mm**, gesamt **23,8 L** |
> | 6 | Achsen T × B × H vertauscht | 270 mm ist die **Breite** |
> | 7 | Prismatische Zellen passen nicht | sie **passen** — Folgefehler aus dem Bauraum |
> | 9 | Anfrageblock an Dan Energy | beruht auf den obigen Falschwerten |
>
> Der Abschnitt zum vorderen Steckplatz und zum 12-V-Backup-Akku fehlt hier
> vollständig — siehe `grundlagen.md` Abschnitt 8.1.
>
> Ab hier nur noch als Diskussionsverlauf lesen.

---

# Spezifikation: Kumpan Ignite Akku-Nachbau

**Projekt:** Ersatz der originalen Kumpan-Kraftpaket-2.0-Akkus durch einen selbst
beauftragten / selbst gebauten 14S-Custom-Pack.
**Status:** Konzeptphase / Datensammlung für Angebotsanfrage.
**Zweck dieses Dokuments:** Arbeitsgrundlage für eine Claude-Code-Instanz, die das
Projekt weiterführt. Enthält den bisherigen Diskussionsstand, verifizierte Fakten,
offene Punkte und die nächsten Schritte.

> **Sicherheitshinweis (gilt durchgehend):** Es wird mit ~60 V DC und
> Kurzschlussströmen im Bereich mehrerer hundert Ampere gearbeitet. Ein Zellsatz
> dieser Größe kann bei Kurzschluss Kabel verdampfen und Lichtbögen ziehen.
> Isoliertes Werkzeug verwenden, während der Montage stets einen Pol getrennt
> halten, Zellen gegen Verrutschen und gegen Kurzschluss zum Rahmen isolieren.
> Der Umbau berührt die Betriebserlaubnis und den Versicherungsschutz (siehe
> Abschnitt 8).

---

## 1. Ausgangslage und Motivation

- Fahrzeug: Kumpan Ignite (E-Roller). Genaues Submodell noch zu bestätigen
  (54i:gnite / 1954 Ri / Ri Sport) — bestimmt die reale Motorleistung.
- Vorhanden: **drei** originale Kraftpaket-2.0-Akkus, die ersetzt werden sollen.
- Problem mit den Originalakkus:
  - nachlassende Kapazität, ständige Fehlermeldungen
  - wegen Kumpan-Pleite nicht mehr regulär erhältlich
  - das originale Custom-BMS ist für **Flottenmanagement** ausgelegt (GPS + GSM),
    stark überengineert, zeigt ständig Fehler; Backend-Server nicht mehr
    verlässlich verfügbar.
- Entscheidung des Nutzers: **Weg B** — Ausstieg aus dem Kumpan-BMS-Ökosystem,
  Fremdakku + CAN-Emulation. (Weg A = Zelltausch im Originalgehäuse mit Erhalt des
  OEM-BMS wurde bewusst verworfen, weil genau dieses BMS das Problem ist.)

---

## 2. Zielsetzung (harte Anforderungen)

- **Kapazität:** mindestens die Leistung der drei Kraftpakete 2.0 zusammen.
  - 3 × 1,48 kWh = **4,44 kWh** → bei 51,8 V nominal ≈ **85 Ah** (Untergrenze).
  - Optionale Reserve gegen Alterung: ~90 Ah / ~4,66 kWh, falls Bauraum es hergibt.
- **Bauform:** fest verbaut (kein Wechselakku). Garage vorhanden, daher akzeptabel.
- **Spannungslage:** 14S beibehalten (siehe Abschnitt 4) — entspricht dem Original.

---

## 3. Referenz-Umbau: Nutzer „JJac" (Elektroroller-Forum)

Quelle: https://www.elektroroller-forum.de/viewtopic.php?p=414287#p414287

JJac hat an einem 54RI Ignite erfolgreich umgebaut:
- Akku: 60 V / 60 Ah in **14S1P** aus prismatischen Einzelzellen (Schraubpole),
  alternativ günstige Auto-Rückläufer. Zellsatz ~250–400 €.
- BMS: 300–500 A, ~150–200 €.
- Gesamtkosten ~600 € (vs. ~1400 € für zwei Kraftpakete 2.0).
- Anordnung: gerader Boden, 2 × 7 Zellen übereinander, BMS oben/seitlich; Raum
  über dem Hinterrad bleibt frei (→ Schacht ist **kein** glatter Quader).
- Original-Akkubuchsen entfernt, Leistungskabel direkt an die Verteilerplatine
  (nur wegen der massiven Schraubanschlüsse behalten). Sicherung dort: 3 × 60 A
  parallel.
- CAN-Kabel aus **ECU B** (gingen vorher zu den Akkus) werden Eingang→Ausgang
  durchgeschleift. Roller braucht dann nur noch **+ und −** von der Batterie.
- Controller-Freigabe via **„Raffis Modul" (V1/V2)** — eingeschleift in den
  CAN-Bus, ersetzt das OEM-BMS vollständig.
- Spitzenleistung laut (ungenauer) BMS-Anzeige ~14 kW.
- Ladegerät: Aftermarket, 13 A, ~60–70 €.
- Für höhere Spannungen (72 V) wäre beim 1954L ein Sabvoton-Controllerwechsel
  nötig. Für 14S bleibt die Original-Elektrik.

**Abgrenzung zum vorliegenden Projekt:** JJac fährt 60 Ah (≈ JJac-Niveau,
~90 km). Dieses Projekt verlangt **Parität zu drei Packs (~85 Ah)**, also größere
Zellen bzw. mehr Parallelkapazität als bei JJac.

---

## 4. Elektrische Spezifikation (verifiziert)

Das **Original-Kraftpaket ist bereits ein 14S-Pack** (Forenbelege sprechen von
„jedes beliebige 14s Ladegerät"; Nennspannungsangaben 50,2–51 V passen zu
14 × 3,6–3,7 V NMC). Das bedeutet: Der Original-Controller ist ab Werk für 14S
ausgelegt — JJacs „60 V" sind lediglich die Ladeschluss-nahe Sprechweise.

| Parameter | Wert |
|---|---|
| Konfiguration | 14S (NMC) |
| Nennspannung | 51,8 V (14 × 3,7 V) |
| Ladeschlussspannung | 58,8 V (14 × 4,2 V) |
| Entladeschluss | ~42 V (14 × 3,0 V) |
| Dauerstrom | 80–100 A |
| Spitzenstrom (~10 s) | 150–240 A |
| Kapazität | ≥ 85 Ah (≥ 4,44 kWh) |
| Maximalgewicht | ≤ 30 kg (leichter bevorzugt) |

**Herleitung der Ströme:**
- Dauer: Original-Kraftpaket 2.0 = 4 kW → 4000 / 51,8 ≈ 77 A pro Pack. Der einzelne
  Ersatzpack muss den gesamten Fahrstrom allein liefern → 80–100 A ansetzen.
- Spitze: Rollerspitze modellabhängig bis 7 kW (1954 Ri Sport) → 7000 / 51,8 ≈
  135 A. JJacs ~14 kW-Anzeige entspräche ~240 A, ist aber laut ihm ungenau.
- **Im Zweifel höheren Spitzenstrom angeben** — ein zu knappes BMS schaltet beim
  Beschleunigen ab oder wird im Dauerbetrieb heiß.

**LFP-Abwägung:** 14S LFP ergäbe nur ~44,8 V nom / 51,1 V Ladeschluss → zu niedrig
für den auf 14S-NMC ausgelegten Controller. Wollte man LFP (thermisch sicherer),
bräuchte man ~16S — das berührt aber Controller-Fenster und Raffis Modul und ist
NICHT gesetzt. **Default bleibt 14S NMC.**

---

## 5. Chemie- / Spannungsabstimmung mit Raffis CAN-Modul — OFFEN

- Nutzer ist **bereits mit Raffler in Kontakt und hat das Modul** (bzw. Zugang dazu).
- **Zu klären mit Raffler (kritisch, vor Zellkauf):**
  1. Auf welches Spannungsfenster sind Modul + Controller ausgelegt? (Bestätigung
     14S NMC ~58,8 V.)
  2. Leitet das Modul den SoC aus der Batteriespannung ab oder braucht es einen
     separaten Abgriff?
  3. Genaue Einschleif-Position im CAN-Bus, Terminierung (120 Ω?), benötigte
     CAN-Frames.
  4. Welchen Spitzenstrom zieht der Original-Controller real (schärft die
     BMS-Dimensionierung, spart Kosten).
- Diese Details sind **nicht öffentlich dokumentiert** — nur Raffler kennt die
  Firmware-Spezifika seiner V1/V2.
- Kontakt: Telegram `t.me/raffler5` bzw. PN im Forum.

---

## 6. Bauraum

**Verifizierte Kumpan-Angabe (Außenmaß eines Kraftpakets, konsistent über
1.5/2.0):** **210 × 90 × 340 mm** (T × B × H), ~10 kg.

Ableitung Gesamtraum (drei Fächer nebeneinander):
- grob **~270 × 210 × 340 mm** brutto (~19 L), abzüglich Trennstege.
- Trennstege zwischen den Fächern lassen sich für den Custom-Pack entfernen →
  gewinnt deren Materialstärke.

**WICHTIG — noch zu verifizieren (Blocker für verbindliches Angebot):**
- Reale **Innenmaße** des leeren Schachts (Einschubtoleranz, Führungsschienen,
  Steckkontakte am Boden vergrößern ggü. dem Akku-Außenmaß).
- Geometrie: durchgehender Quader **oder** ragt der Radkasten des Hinterrads /
  ragen Verstrebungen hinein? (JJacs Hinweis „Raum über Hinterrad frei" deutet auf
  nicht-quaderförmigen Raum.)
- **To-Do Nutzer:** leeren Schacht ausmessen (nutzbare B × T × H), ggf. Foto.

---

## 7. Zell-/Bauform-Optionen (Passungsrechnung)

Ziel ≥ 85 Ah bei 14S.

### Kandidat A — Große prismatische NMC-Zellen, 14S1P (JJac-Prinzip, hochskaliert)
- Benötigt 14 Zellen à ≥ 85 Ah. Beispiel-Referenz: 3,7 V / ~90–93 Ah NMC-Prisma,
  Format grob ~148 × 43 × 91 mm oder ~173 × 45 × 100 mm.
  (Kleinere Referenz zur Formatabschätzung: CALB L148N58 = 58 Ah, ~148 × 27 × 91 mm.)
- Kapazität: ~90 Ah × 51,8 V ≈ 4,3–4,66 kWh ✓
- Passung: 2 × 7 liegend → 7 × 43 mm ≈ 301 mm + Verbinder > 270 mm Breite.
  **Sprengt den 270-mm-Bauraum bei 2×7.** Lösbar nur über Höhenverteilung
  (2 Ebenen mit Zwischenboden) oder schlankeres Zellformat.
- Vorteil: mechanisch simpel (14 Verschraubungen, kein Schweißen), nah an JJac.
- Zellkosten grob: ~1.400–1.900 €.

### Kandidat B — Rundzellen 21700 in 14S20P
- 14S20P mit Hochstrom-21700 (z. B. Molicel P42A ~4,2 Ah / P45B): 20 × 4,2 = 84 Ah
  → ~4,35 kWh ✓ (Parität fast punktgenau).
- Zellzahl: 14 × 20 = **280 Zellen**, ~8,6 L netto → passt bequem in ~19 L brutto.
- Vorteil: an verwinkelte Schachtgeometrie anpassbar (z. B. je ein 14S-Block pro
  Original-Schachtposition, dann parallel).
- Nachteil: **280 Zellen punktschweißen** (Spotwelder, Nickelband, Balancing),
  teuer (~2.000–2.500 € nur Zellen).

### Kandidat C — schlanke Prismazellen ~50–58 Ah
- Verfehlt das Muss-Kriterium (Parität) → verworfen, außer als Notlösung.

**Vergleich:**

| | Kapazität | Zellen | Zellkosten grob | Schweißaufwand | Bauraum |
|---|---|---|---|---|---|
| A: 14× ~90 Ah Prisma | ~4,3–4,66 kWh | 14 | ~1.400–1.900 € | gering | eng, Umbau nötig |
| B: 14S20P 21700 | ~4,35 kWh | 280 | ~2.000–2.500 € | hoch | flexibel, passt gut |

**Empfehlungstendenz:** A ist mechanisch simpler und näher an JJacs erprobtem Weg,
scheitert aber evtl. am Bauraum → hängt an der Schacht-Vermessung (Abschnitt 6).
B passt räumlich besser, kostet aber erheblichen Schweiß-/Balancing-Aufwand.
Entscheidung erst nach realer Schacht-Vermessung und Raffler-Rückmeldung.

---

## 8. Rechtlicher Rahmen (kein Rechtsrat)

- Spannungs-/Leistungsumbau am Antrieb ist grundsätzlich eintragungs-/
  abnahmepflichtig. Bei gleichbleibender Nennspannungsklasse (14S wie Original) und
  Leistung mit einer Prüforganisation klären, was konkret relevant wird.
- Versicherungsschutz im öffentlichen Raum ist an eine gültige Betriebserlaubnis
  gekoppelt.
- Reverse-Engineering des eigenen, gekauften Fahrzeugs zwecks Reparatur/
  Interoperabilität ist in der EU grundsätzlich zulässig. Nachbau der CAN-Platine
  für den Eigengebrauch unproblematisch; nur Weiterverbreiten/Verkauf kann
  Schutzrechte berühren.

---

## 9. Lieferant Custom-Pack: Dan Energy

Dan Energy (Custom-Akku-Hersteller) hat um folgende Angaben gebeten. Fertiger Block
für die Anfrage:

```
Anfrage Custom-Akku — E-Roller (Kumpan Ignite, 14S-Ersatzpack)

Konfiguration:        14S (NMC)
Nennspannung:         51,8 V
Ladeschlussspannung:  58,8 V
Entladeschluss:       ~42 V
Dauerstrom:           80–100 A
Spitzenstrom (~10 s): 150–240 A
Kapazität:            ≥ 85 Ah (≥ 4,44 kWh)
Maximalgewicht:       ≤ 30 kg (leichter bevorzugt)
Bauraum (pro Fach):   210 × 90 × 340 mm (T × B × H)
Bauraum gesamt (3 Fächer zusammengelegt): ca. 270 × 210 × 340 mm
                      — Innenmaße Schacht noch zu verifizieren

Fest verbauter Einbau (kein Wechselakku).
Anwendung: Ersatz für 3× Kumpan Kraftpaket 2.0.
```

---

## 10. Offene Punkte / Nächste Schritte

1. **Rollermodell bestätigen** (54i:gnite / 1954 Ri / Ri Sport) → schärft
   Spitzenstrom und damit BMS-Dimensionierung.
2. **Schacht ausmessen** (nutzbare Innenmaße B × T × H; Quader vs. Radkasten/
   Verstrebungen; Foto). → Blocker für Zellwahl (A vs. B) und für verbindliches
   Dan-Energy-Angebot.
3. **Raffler kontaktieren** zu: Spannungsfenster-Bestätigung, SoC-Abgriff,
   CAN-Einschleifposition/Terminierung/Frames, realer Controller-Spitzenstrom.
4. **Zell-/Bauform-Entscheidung** (A prismatisch vs. B 21700) nach 2. und 3.
5. **BMS wählen** passend zu finalem Strom (Reserve einplanen), getrennter oder
   ausreichend dimensionierter Lade-/Entladepfad.
6. **Ladegerät** passend zur Chemie: 58,8 V (14S NMC) CC/CV, ~13 A.
7. **Leistungsverkabelung:** 25–35 mm² Hauptkabel, kurze Wege; träge Hauptsicherung
   (z. B. 200 A ANL/Mega) + Vorladewiderstand gegen Einschalt-Lichtbogen am
   Controller-Kondensator.
8. **Mechanik:** Zellsatz vibrationsfest fixieren, gegen Rahmen isolieren.
9. **CAN-Integration** nach JJac-Muster mit Raffis Modul; ECU-B-CAN-Leitungen
   durchschleifen, nur +/− vom Pack an die Verteilerplatine.
10. **Zulassung/Versicherung**: Prüforganisation kontaktieren.

---

## 11. Faktenbasis / Quellen

- Kumpan-Kraftpaket-Maße/Daten: offizielle Kumpan-Angaben und Händler-/
  Testberichte (210 × 90 × 340 mm; 51 V / 29 Ah / ~1.470–1.479 Wh; ~10 kg;
  4 kW; 14S).
- JJac-Umbau + Raffis Modul: Elektroroller-Forum,
  https://www.elektroroller-forum.de/viewtopic.php?p=414287#p414287
- Zell-Referenzen (Formate/Kapazitäten): diverse NMC-Prisma-Anbieter
  (CALB L148N58 58 Ah als Formatanker; 90–93 Ah-Klasse als Zielgröße).
- Rundzell-Option: Molicel 21700 (P42A/P45B) als Hochstromreferenz.

> Werte mit „~", „grob", „ca." sind Schätzungen/Herleitungen und vor Bestellung zu
> verifizieren. Insbesondere Spitzenstrom und Schacht-Innenmaße sind noch nicht
> gemessen, sondern abgeleitet.
