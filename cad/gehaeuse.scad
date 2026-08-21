// ═══════════════════════════════════════════════════════════════════
//  Zellblock 16 — Gehäusesegmente
//
//  Zwei Segmente, weil 425 mm nicht in die 340 mm Bauhöhe des H2S
//  passen. Die Trennfuge liegt auf der Oberkante der Zwischenplatte:
//  dort ist ohnehin eine steife Ebene, und keine Zelle wird geschnitten.
//
//  Das Gehäuse trägt nichts. Die Zellverspannung von 6–10 kN je Etage
//  läuft ausschließlich über die Aluplatten und die waagerechten
//  Zugstangen. Hier geht es um Hülle, Führung im Schacht und Isolierung
//  gegen den Rahmen.
//
//  Verbunden werden die Segmente nicht miteinander, sondern jeweils mit
//  der durchgehenden hinteren Aluplatte: Sie ist 400 mm hoch, überbrückt
//  die Fuge und hält beide Hälften. Die Zentrierzapfen sorgen nur für
//  Flucht beim Zusammensetzen.
//
//  Ausgabe:
//    openscad -D 'teil="unten"' -o segment_unten.stl gehaeuse.scad
//    openscad -D 'teil="oben"'  -o segment_oben.stl  gehaeuse.scad
// ═══════════════════════════════════════════════════════════════════

include <parameter.scad>
use <kontur.scad>

teil = "unten";   // "unten" | "oben" | "beide"

// ── Zentrierzapfen ─────────────────────────────────────────────────
// In den Stirnwänden, wo mit 8 mm genug Material sitzt. In den 2,5 mm
// dünnen Seitenwänden wäre kein Platz.
zapfen_x = [ fach_b/2, bauraum_b/2, bauraum_b - fach_b/2 ];

module zapfen_positionen() {
    for (x = zapfen_x)
        for (y = [ wand_stirn/2, bauraum_t - wand_stirn/2 ])
            translate([x, y, 0])
                children();
}

module zapfen(spiel = 0) {
    translate([-zapfen_l/2 - spiel, -zapfen_b/2 - spiel, 0])
        cube([zapfen_l + 2*spiel, zapfen_b + 2*spiel, zapfen_h + spiel]);
}

// ── Befestigung an der hinteren Aluplatte ──────────────────────────
// Durch die Rückwand in Gewinde im 8 mm starken Aluminium. Damit hängen
// beide Segmente an derselben Platte und sind darüber verbunden.
module plattenschrauben(z_von, z_bis) {
    n  = schrauben_je_segment;
    dz = (z_bis - z_von) / (n + 1);
    for (i = [1 : n])
        for (x = [ bauraum_b/2 - 90, bauraum_b/2 + 90 ])
            translate([x, wand_stirn + 1, z_von + i*dz])
                rotate([90, 0, 0]) {
                    cylinder(d = schraube_d, h = wand_stirn + 2);
                    translate([0, 0, wand_stirn - 2.2])
                        cylinder(d1 = schraube_d, d2 = schraube_kopf, h = 2.4);
                }
}

// ── Grundkörper eines Segments ─────────────────────────────────────
module segment_rohling(h) {
    linear_extrude(height = h) wand_2d();
}

// ── Unterteil ──────────────────────────────────────────────────────
module segment_unten() {
    difference() {
        union() {
            // Boden über die volle Fläche: Er leitet die 43 kg flächig
            // in den Schachtboden ein. Deshalb durchgehend, nicht als
            // Ring — konstruktion.md §6.
            linear_extrude(height = boden_dicke) aussen_2d();
            segment_rohling(seg_u_h);
            plattenfuss();
            translate([0, 0, seg_u_h]) zapfen_positionen() zapfen();
        }
        // Kabeldurchführungen an den Fachmitten, wo die Originalkontakte
        // saßen. Deren Öffnungen im Schachtboden werden weiterverwendet.
        for (x = zapfen_x)
            translate([x, bauraum_t - wand_stirn - 26, -1])
                cylinder(d = kabel_d, h = boden_dicke + 2);
        plattenschrauben(boden_dicke + 20, seg_u_h - 12);
    }
}

// Keine Bodenverrippung: Der Boden liegt vollflächig auf dem
// Schachtboden auf und kann sich deshalb gar nicht durchbiegen. Er muss
// die Last nur durchleiten, nicht auf Biegung aufnehmen. Rippen würden
// hier nur die Zellen anheben, statt auf dem Boden stehen zu lassen.

// Zwei flache Nasen, auf denen die vordere Aluplatte beim Einsetzen
// steht, bevor die Zugstangen sie fixieren.
module plattenfuss() {
    for (x = [ bauraum_b/2 - 70, bauraum_b/2 + 70 ])
        translate([x - 14, platte_vorn_y - 1, boden_dicke])
            cube([28, endplatte_dicke + 2, 3]);
}

// ── Oberteil ───────────────────────────────────────────────────────
module segment_oben() {
    difference() {
        segment_rohling(seg_o_h);
        // Gegentaschen für die Zentrierzapfen
        translate([0, 0, -0.1]) zapfen_positionen() zapfen(zapfen_spiel);
        plattenschrauben(12, seg_o_h - 30);
        lueftung();
    }
    deckelauflage();
}

// Entlüftung im Kopfraum. Die Zellen geben ihre Wärme fast nur über
// Pole und Böden ab (1–2 W/(m·K) durch die Dicke gegen 18–24 in der
// Ebene), deshalb muss die Luft oben zirkulieren können.
module lueftung() {
    // Nur im Kopfraum über der oberen Zellebene, und mit Abstand zur
    // Deckelauflage — sonst wären es oben offene Nuten statt Schlitze.
    zellen_oben = seg_o_h - kopfraum;
    z0 = zellen_oben + 2;
    h  = kopfraum - deckel_dicke - 5;
    for (i = [0 : lueftung_n - 1]) {
        x = bauraum_b * (i + 0.5) / lueftung_n;
        for (y = [-1, bauraum_t - wand_stirn - 1])
            translate([x - lueftung_b/2, y, z0])
                cube([lueftung_b, wand_stirn + 2, h]);
    }
    echo(str("Lüftungsquerschnitt ",
             2 * lueftung_n * lueftung_b * h, " mm²"));
}

// Umlaufende Stufe innen, auf der der Deckel aufliegt und bündig
// abschließt. Als aufgesetzte Stufe, nicht als eingefräster Falz: Ein
// Falz würde die 2,5 mm dünnen Seitenwände auf unter 1 mm reduzieren.
// Im Kopfraum ist dafür Platz, weil dort keine Zellen mehr stehen.
module deckelauflage() {
    z0 = seg_o_h - deckel_dicke - auflage_b;
    difference() {
        translate([0, 0, z0])
            linear_extrude(height = auflage_b) innen_2d();
        translate([0, 0, z0 - 0.1])
            linear_extrude(height = auflage_b + 0.2)
                offset(delta = -auflage_b) innen_2d();
    }
}

// ── Ausgabe ────────────────────────────────────────────────────────
if (teil == "unten")      segment_unten();
else if (teil == "oben")  segment_oben();
else {
    segment_unten();
    translate([0, bauraum_t + 40, 0]) segment_oben();
}

echo(str("Segment unten  eingebaut ", seg_u_h,
         " mm, Druckhöhe ", seg_u_h + zapfen_h, " mm (mit Zapfen)"));
echo(str("Segment oben   eingebaut ", seg_o_h, " mm"));
assert(seg_u_h + zapfen_h <= 340, "Unterteil mit Zapfen über 340 mm Bauhöhe.");
