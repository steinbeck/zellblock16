// ═══════════════════════════════════════════════════════════════════
//  Zellblock 16 — Parameter
//  Alle Maße in mm. Quelle: ../konstruktion.md
//
//  Diese Datei ist die einzige Stelle, an der Maße stehen. Ändert sich
//  eines — etwa nach dem Testdruck — pflanzt es sich durch alle Teile
//  fort. Nie Maße in die Geometriedateien schreiben.
// ═══════════════════════════════════════════════════════════════════

// ── Bauraum ────────────────────────────────────────────────────────
// Vereinigung dreier Kraftpaket-Grundrisse. konstruktion.md §5.1
bauraum_b      = 270;    // Breite,  3 × 90 mm Fachbreite
bauraum_t      = 215;    // Tiefe
bauraum_h      = 430;    // Höhe, nach Ausbau der Bodenkontakte
fach_b         =  90;    // Breite eines Originalfachs
eckradius      =   5;    // Vertikalkanten des Originalakkus. Erzeugt
                         // zugleich die Zwickelnuten für die Rippen.

// ── Zelle: EVE LF105 ───────────────────────────────────────────────
// Herstellerdatenblatt RD-LF105-S01-LF Rev. C. konstruktion.md §2
zelle_l        = 130.30; // Länge
zelle_t        =  36.35; // Dicke, unter 300 kgf bei 30–40 % SOC
zelle_h1       = 200.50; // Höhe über Pole
zelle_h2       = 195.50; // Höhe Gehäuse
zelle_tol      =   0.50; // Fertigungstoleranz je Maß
zelle_polabst  =  67.00; // Polabstand

zellen_je_reihe = 2;     // nebeneinander in der Breite
zellen_je_stapel= 4;     // hintereinander in der Tiefe
etagen          = 2;

// ── Wandstärken ────────────────────────────────────────────────────
// ACHTUNG Stirnwand: Die Zwickelnut zieht die Außenkontur um
// eckradius (5 mm) ein. Die Stirnwand muss deshalb mindestens
// eckradius + wand_min stark sein, sonst ist sie am Zwickel
// durchbrochen. konstruktion.md nannte 5,0 mm — das war zu wenig.
wand_min       = 3.0;                       // dünnste tragbare Wand
wand_seite     = 2.5;                       // links/rechts, Engpass Breite
wand_stirn     = eckradius + wand_min;      // vorn/hinten = 8,0 mm
boden_dicke    = 6.0;
zwischenplatte = 12.0;
deckel_dicke   = 4.0;

// ── Skelett ────────────────────────────────────────────────────────
endplatte_dicke = 8.0;   // Aluminium
endplatte_b     = 260.0;
endplatte_h     = 400.0;
zugstange_d     = 8.0;   // M8

// ── Fertigung ──────────────────────────────────────────────────────
druck_tol      = 0.4;    // erwartete Maßabweichung H2S über 270 mm
segment_h      = 215;    // Gehäusesegment, 2 × = bauraum_h

// ── Auflösung ──────────────────────────────────────────────────────
$fn = 48;

// ═══════════════════════════════════════════════════════════════════
//  Abgeleitete Größen — nicht von Hand ändern
// ═══════════════════════════════════════════════════════════════════
innen_b     = bauraum_b - 2 * wand_seite;              // 265,0
innen_t     = bauraum_t - 2 * wand_stirn;              // 199,0

zellblock_b = zellen_je_reihe  * zelle_l;              // 260,6
zellblock_t = zellen_je_stapel * zelle_t;              // 145,4

spiel_b     = innen_b - zellblock_b - 2 * zelle_tol;   // 3,4 → 1,7 je Seite
rest_t      = innen_t - zellblock_t - 2 * endplatte_dicke; // für BMS

// Höhenbilanz. konstruktion.md §8.1
hoehe_belegt = boden_dicke + zelle_h2 + zwischenplatte
             + zelle_h2 + 12 + deckel_dicke;
hoehe_reserve = bauraum_h - hoehe_belegt;

echo(str("── Zellblock 16 ──────────────────────────"));
echo(str("Innenmaß          ", innen_b, " × ", innen_t, " mm"));
echo(str("Zellblock         ", zellblock_b, " × ", zellblock_t, " mm"));
echo(str("Spiel Breite      ", spiel_b, " mm gesamt, ",
         spiel_b/2, " je Seite"));
echo(str("Rest Tiefe        ", rest_t, " mm für BMS und Kabel"));
echo(str("Höhe belegt       ", hoehe_belegt, " mm"));
echo(str("Höhe Reserve      ", hoehe_reserve, " mm"));

assert(spiel_b > 2 * druck_tol,
  "Spiel in der Breite kleiner als die doppelte Drucktoleranz.");
assert(hoehe_reserve > 0,
  "Höhenbilanz überschritten.");
assert(wand_stirn >= eckradius + wand_min,
  "Stirnwand zu dünn: die Zwickelnut würde sie durchbrechen.");
